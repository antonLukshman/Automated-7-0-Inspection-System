from django.contrib import admin
from .models import FabricDefect, CLIInspector, Supervisor,Inspection

@admin.register(FabricDefect)
class FabricDefectAdmin(admin.ModelAdmin):
    list_display = ('id', 'defect_type', 'severity', 'detected_at')

@admin.register(CLIInspector)
class CLIInspectorAdmin(admin.ModelAdmin):
    list_display = ('id', 'name', 'email', 'phone', 'date_joined')

@admin.register(Supervisor)
class SupervisorAdmin(admin.ModelAdmin):
    list_display = ('id', 'name', 'email', 'phone', 'department')

@admin.register(Inspection)
class InspectionAdmin(admin.ModelAdmin):
    list_display = ('id', 'cli_inspector', 'supervisor', 'status', 'inspection_date')