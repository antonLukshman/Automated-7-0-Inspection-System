from django.urls import path
from .views import (
    UserRegistration,
    UserLogin,
    InspectionListCreateView,
    InspectionDetailView,
    FabricDefectListCreateView,
    FabricDefectDetailView,
    review_defect,
    home  # Import the home view
)
from . import views

urlpatterns = [
    path('register/', UserRegistration.as_view(), name='user-register'),
    path('login/', UserLogin.as_view(), name='user-login'),
    path('inspections/', InspectionListCreateView.as_view(), name='inspections'),
    path('inspections/<int:pk>/', InspectionDetailView.as_view(), name='inspection-detail'),
    path('defects/', FabricDefectListCreateView.as_view(), name='defects'),
    path('defects/<int:pk>/', FabricDefectDetailView.as_view(), name='defect-detail'),
    path('defects/review/<int:defect_id>/', review_defect, name='review-defect'),
    path('api/defects/analyze/', views.analyze_defect_image, name='analyze-defect'),
    path('', home, name='home'),  # Add this line
]