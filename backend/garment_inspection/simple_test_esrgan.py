import sys
import os

# Add project root and parent directories to Python path
project_root = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..'))
backend_dir = os.path.abspath(os.path.join(os.path.dirname(__file__), '..'))
garment_inspection_dir = os.path.abspath(os.path.join(os.path.dirname(__file__)))

sys.path.insert(0, project_root)
sys.path.insert(0, backend_dir)
sys.path.insert(0, garment_inspection_dir)

print("Added to Python path:")
print(f"1. {project_root}")
print(f"2. {backend_dir}")
print(f"3. {garment_inspection_dir}")

# Diagnostic print of Python path
print("\nCurrent Python Path:")
for path in sys.path:
    print(path)

# Try importing
try:
    # Try different import strategies
    print("\nTrying imports:")
    
    # Strategy 1: Direct import from inspection
    print("Strategy 1: from inspection.esrgan import GarmentSuperResolution")
    try:
        from inspection.esrgan import GarmentSuperResolution
        print("Strategy 1 succeeded!")
    except ImportError as e:
        print(f"Strategy 1 failed: {e}")
    
    # Strategy 2: Relative import
    print("\nStrategy 2: from .esrgan import GarmentSuperResolution")
    try:
        from .esrgan import GarmentSuperResolution
        print("Strategy 2 succeeded!")
    except ImportError as e:
        print(f"Strategy 2 failed: {e}")
    
    # Strategy 3: Absolute import with full path
    print("\nStrategy 3: from garment_inspection.inspection.esrgan import GarmentSuperResolution")
    try:
        from garment_inspection.inspection.esrgan import GarmentSuperResolution
        print("Strategy 3 succeeded!")
    except ImportError as e:
        print(f"Strategy 3 failed: {e}")

    # If we get here, create an instance to verify full functionality
    print("\nCreating GarmentSuperResolution instance:")
    sr = GarmentSuperResolution()
    print("Instance created successfully!")

except Exception as e:
    print(f"Unexpected error: {e}")
    import traceback
    traceback.print_exc()

# Bonus: Check contents of current directory and inspection directory
print("\nContents of current directory:")
print(os.listdir('.'))

print("\nContents of inspection directory:")
print(os.listdir('inspection'))