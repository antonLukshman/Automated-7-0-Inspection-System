from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status, generics
from rest_framework.permissions import AllowAny, IsAuthenticated
from rest_framework_simplejwt.tokens import RefreshToken
from .serializers import UserSerializer, InspectionSerializer, FabricDefectSerializer
from django.contrib.auth import authenticate
from django.contrib.auth.models import User
from .models import FabricDefect, Inspection
from rest_framework.decorators import api_view, permission_classes, parser_classes
from rest_framework.parsers import MultiPartParser, FormParser
from django.http import HttpResponse
import requests
from django.conf import settings
from django.utils import timezone

# User Registration View
class UserRegistration(APIView):
    permission_classes = [AllowAny]
    
    def post(self, request):
        serializer = UserSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response({
                'message': 'User registered successfully',
                'user': serializer.data
            }, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

# User Login View
class UserLogin(APIView):
    permission_classes = [AllowAny]
    
    def post(self, request):
        username = request.data.get('username')
        password = request.data.get('password')
        
        user = authenticate(username=username, password=password)
        
        if user:
            refresh = RefreshToken.for_user(user)
            return Response({
                'message': 'Login successful',
                'access': str(refresh.access_token),
                'refresh': str(refresh),
                'user_id': user.id
            }, status=status.HTTP_200_OK)
        
        return Response({
            'error': 'Invalid credentials'
        }, status=status.HTTP_401_UNAUTHORIZED)

# Inspection List and Create View
class InspectionListCreateView(generics.ListCreateAPIView):
    queryset = Inspection.objects.all()
    serializer_class = InspectionSerializer
    permission_classes = [IsAuthenticated]
    
    def perform_create(self, serializer):
        serializer.save(user=self.request.user)

# Inspection Detail, Update, and Delete View
class InspectionDetailView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Inspection.objects.all()
    serializer_class = InspectionSerializer
    permission_classes = [IsAuthenticated]
    
    def perform_update(self, serializer):
        serializer.save(user=self.request.user)

# FabricDefect List and Create View
class FabricDefectListCreateView(generics.ListCreateAPIView):
    queryset = FabricDefect.objects.all()
    serializer_class = FabricDefectSerializer
    permission_classes = [IsAuthenticated]
    
    def perform_create(self, serializer):
        inspection_id = self.request.data.get('inspection')
        inspection = Inspection.objects.get(id=inspection_id)
        serializer.save(inspection=inspection)

# FabricDefect Detail, Update, and Delete View
class FabricDefectDetailView(generics.RetrieveUpdateDestroyAPIView):
    queryset = FabricDefect.objects.all()
    serializer_class = FabricDefectSerializer
    permission_classes = [IsAuthenticated]

# Review Defect View
@api_view(['POST'])
@permission_classes([IsAuthenticated])
def review_defect(request, defect_id):
    try:
        defect = FabricDefect.objects.get(id=defect_id)
    except FabricDefect.DoesNotExist:
        return Response({
            "error": "Defect not found"
        }, status=status.HTTP_404_NOT_FOUND)
    
    defect.reviewed = True
    defect.save()
    
    return Response({
        "message": "Defect reviewed successfully",
        "defect_id": defect.id,
        "reviewed": defect.reviewed
    }, status=status.HTTP_200_OK)

def home(request):
    return HttpResponse("Welcome to the Garment Inspection System")

# New function to analyze images with Azure Custom Vision
@api_view(['POST'])
@permission_classes([IsAuthenticated])
@parser_classes([MultiPartParser, FormParser])
def analyze_defect_image(request):
    """
    Analyze a captured image using Azure Custom Vision to identify garment defects.
    """
    try:
        # Check if image is provided in the request
        if 'image' not in request.FILES:
            return Response(
                {"error": "No image provided. Please capture an image first."}, 
                status=status.HTTP_400_BAD_REQUEST
            )
        
        image_file = request.FILES['image']
        
        # Get the prediction URL from settings
        prediction_url = settings.AZURE_PREDICTION_URL
        
        # The URL from settings should already have "/image" suffix based on azure.env
        # No need to add it again, but we'll check just to be safe
        if not prediction_url.endswith('/image'):
            prediction_url += '/image'
            
        # Prepare headers for Azure API call
        headers = {
            'Prediction-Key': settings.AZURE_CUSTOM_VISION_KEY,
            'Content-Type': 'application/octet-stream'
        }
        
        # Send the image to Azure Custom Vision
        try:
            # Read image data
            image_data = image_file.read()
            
            response = requests.post(
                prediction_url,
                headers=headers,
                data=image_data
            )
        except requests.RequestException as e:
            return Response(
                {"error": f"Error communicating with Azure Custom Vision: {str(e)}"}, 
                status=status.HTTP_502_BAD_GATEWAY
            )
        
        # Process Azure response
        if response.status_code == 200:
            prediction_results = response.json()
            
            # Get the most likely defect type from Azure predictions
            defect_type = "Unknown Defect"
            severity = "Low"
            confidence = 0.0
            
            if 'predictions' in prediction_results and prediction_results['predictions']:
                # Sort predictions by probability and get the top one
                top_prediction = sorted(
                    prediction_results['predictions'], 
                    key=lambda x: x['probability'], 
                    reverse=True
                )[0]
                
                # Use predictions if confidence is above threshold
                if top_prediction['probability'] > 0.5:
                    defect_type = top_prediction['tagName']
                    confidence = top_prediction['probability']
                    
                    # Set severity based on confidence level
                    if confidence > 0.85:
                        severity = "High"
                    elif confidence > 0.65:
                        severity = "Medium"
                    else:
                        severity = "Low"
            
            # Reset file pointer to beginning for saving
            image_file.seek(0)
            
            # Create defect record
            defect = FabricDefect.objects.create(
                defect_type=defect_type,
                severity=severity,
                image=image_file,
                reviewed=False
            )
            
            # Handle inspection association if provided
            inspection_id = request.data.get('inspection_id')
            if inspection_id:
                try:
                    # Find the inspection to associate with this defect
                    inspection = Inspection.objects.get(id=inspection_id)
                    
                    # Update the fabric_defect field of the inspection
                    # Note: This assumes your model relationship is set up correctly
                    inspection.fabric_defect = defect
                    inspection.save()
                except Inspection.DoesNotExist:
                    pass  # Silently ignore if inspection doesn't exist
            
            # Return success response with Azure predictions
            return Response({
                "message": "Image analyzed successfully",
                "defect": {
                    "id": defect.id,
                    "type": defect_type,
                    "severity": severity,
                    "confidence": round(confidence * 100, 2)  # As percentage
                },
                "predictions": prediction_results['predictions']
            }, status=status.HTTP_200_OK)
        else:
            # Azure returned an error
            return Response({
                "error": "Azure Custom Vision analysis failed",
                "details": response.text
            }, status=status.HTTP_502_BAD_GATEWAY)
    
    except Exception as e:
        # General exception handling
        import logging
        logger = logging.getLogger('inspection')
        logger.error(f"Error in analyze_defect_image: {str(e)}")
        
        return Response(
            {"error": f"An unexpected error occurred: {str(e)}"}, 
            status=status.HTTP_500_INTERNAL_SERVER_ERROR
        )
    
def get_total_inspections(date):
        # Ensure the date is a datetime.date object
    if isinstance(date, str):
        date = timezone.datetime.strptime(date, '%Y-%m-%d').date()

    # Filter inspections by the date part of the inspection_date field
    total_inspections = Inspection.objects.filter(
        inspection_date__date=date
    ).count()
    return total_inspections