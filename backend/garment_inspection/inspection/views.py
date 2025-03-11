from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status, generics
from rest_framework.permissions import AllowAny, IsAuthenticated
from rest_framework_simplejwt.tokens import RefreshToken
from .serializers import UserSerializer, InspectionSerializer, FabricDefectSerializer
from django.contrib.auth import authenticate
from django.contrib.auth.models import User
from .models import FabricDefect, Inspection
from rest_framework.decorators import api_view, permission_classes
from django.http import HttpResponse

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