from django.db import models
from django.contrib.auth.models import User

class FabricDefect(models.Model):
    defect_type = models.CharField(max_length=255)
    severity = models.CharField(max_length=50)
    image = models.ImageField(upload_to='defect_images/', blank=True, null=True)
    detected_at = models.DateTimeField(auto_now_add=True)
    reviewed = models.BooleanField(default=False)  # Added for review_defect functionality
    
    def __str__(self):
        return f"{self.defect_type} - {self.severity}"

class CLIInspector(models.Model):
    name = models.CharField(max_length=255)
    email = models.EmailField(unique=True)
    phone = models.CharField(max_length=15)
    date_joined = models.DateTimeField(auto_now_add=True)
    
    def __str__(self):
        return self.name

class Supervisor(models.Model):
    name = models.CharField(max_length=255)
    email = models.EmailField(unique=True)
    phone = models.CharField(max_length=15)
    department = models.CharField(max_length=100)
    
    def __str__(self):
        return self.name
    
class Inspection(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)  # Added user field
    cli_inspector = models.ForeignKey(CLIInspector, on_delete=models.CASCADE)
    supervisor = models.ForeignKey(Supervisor, on_delete=models.CASCADE)
    fabric_defect = models.ForeignKey(FabricDefect, on_delete=models.CASCADE)
    status = models.CharField(
        max_length=20,
        choices=[('Pending', 'Pending'), ('Reviewed', 'Reviewed'), ('Resolved', 'Resolved')],
        default='Pending'
    )
    inspection_date = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Inspection {self.id} - {self.status}"
    



    