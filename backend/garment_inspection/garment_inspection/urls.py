from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', include('inspection.urls')),
    path('', include('inspection.urls')),  # Add this line
]