import 'package:flutter/material.dart';


class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isNotificationEnabled = true;
  bool _isOfflineModeEnabled = false;
  bool _isBiometricAuthEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        centerTitle: true,
        backgroundColor: Colors.green.shade700,
        elevation: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Profile Section
            _buildProfileSection(context),
            SizedBox(height: 16),

            // Notification Preferences Section
            _buildNotificationSettings(context),
            SizedBox(height: 16),

            // Camera Settings Section
            _buildCameraSettings(context),
            SizedBox(height: 16),

            // Security Settings Section
            _buildSecuritySettings(context),
            SizedBox(height: 16),

            // Offline Mode Section
            _buildOfflineMode(context),
          ],
        ),
      ),
    );
  }

  // Profile Settings - Navigates to Profile Page
  Widget _buildProfileSection(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        title: Text(
          'Profile Settings',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.green.shade800,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: John Doe', style: TextStyle(color: Colors.green.shade600)),
            Text('Role: CLI Inspector', style: TextStyle(color: Colors.green.shade600)),
          ],
        ),
        trailing: Icon(Icons.edit, color: Colors.green.shade700),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EditProfilePage()),
          );
        },
      ),
    );
  }

  // Notification Preferences - Navigates to Notification Settings Page
  Widget _buildNotificationSettings(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        title: Text(
          'Notification Preferences',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.green.shade800,
          ),
        ),
        subtitle: Text('Receive alerts when defects are flagged or tasks are updated.'),
        trailing: Switch(
          value: _isNotificationEnabled,
          onChanged: (bool value) {
            setState(() {
              _isNotificationEnabled = value;
            });
          },
          activeColor: Colors.green.shade700,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NotificationSettingsPage()),
          );
        },
      ),
    );
  }

  // Camera Settings - Navigates to Camera Settings Page
  Widget _buildCameraSettings(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        title: Text(
          'Camera Settings',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.green.shade800,
          ),
        ),
        subtitle: Text('Adjust camera resolution and flash settings.'),
        trailing: Icon(Icons.camera_alt, color: Colors.green.shade700),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CameraSettingsPage()),
          );
        },
      ),
    );
  }

  // Security Settings - Navigates to Security Settings Page
  Widget _buildSecuritySettings(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        title: Text(
          'Security Settings',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.green.shade800,
          ),
        ),
        subtitle: Text('Enable biometric authentication and app lock.'),
        trailing: Switch(
          value: _isBiometricAuthEnabled,
          onChanged: (bool value) {
            setState(() {
              _isBiometricAuthEnabled = value;
            });
          },
          activeColor: Colors.green.shade700,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SecuritySettingsPage()),
          );
        },
      ),
    );
  }

  // Offline Mode - Navigates to Offline Mode Page
  Widget _buildOfflineMode(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        title: Text(
          'Offline Mode',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.green.shade800,
          ),
        ),
        subtitle: Text('Enable offline mode to work without internet connection.'),
        trailing: Switch(
          value: _isOfflineModeEnabled,
          onChanged: (bool value) {
            setState(() {
              _isOfflineModeEnabled = value;
            });
          },
          activeColor: Colors.green.shade700,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => OfflineModePage()),
          );
        },
      ),
    );
  }
}

// Profile Settings Page
class EditProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Settings'),
        backgroundColor: Colors.green.shade700,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Name',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Phone Number',
                prefixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Save profile changes
              },
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}

// Notification Settings Page
class NotificationSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Preferences'),
        backgroundColor: Colors.green.shade700,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SwitchListTile(
              title: Text('Enable Defect Alerts'),
              subtitle: Text('Get notified whenever a defect is flagged.'),
              value: true,
              onChanged: (bool value) {
                // Update notification preferences
              },
            ),
            SwitchListTile(
              title: Text('Enable Task Updates'),
              subtitle: Text('Get notified when a task status changes.'),
              value: false,
              onChanged: (bool value) {
                // Update notification preferences
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Save notification settings
              },
              child: Text('Save Settings'),
            ),
          ],
        ),
      ),
    );
  }
}

// Camera Settings Page
class CameraSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera Settings'),
        backgroundColor: Colors.green.shade700,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Resolution',
                border: OutlineInputBorder(),
              ),
              items: [
                DropdownMenuItem(value: 'Low', child: Text('Low')),
                DropdownMenuItem(value: 'Medium', child: Text('Medium')),
                DropdownMenuItem(value: 'High', child: Text('High')),
              ],
              onChanged: (String? value) {
                // Handle resolution change
              },
            ),
            SizedBox(height: 16),
            SwitchListTile(
              title: Text('Enable Flash'),
              value: true,
              onChanged: (bool value) {
                // Handle flash toggle
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Save camera settings
              },
              child: Text('Save Camera Settings'),
            ),
          ],
        ),
      ),
    );
  }
}

// Security Settings Page
class SecuritySettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Security Settings'),
        backgroundColor: Colors.green.shade700,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SwitchListTile(
              title: Text('Enable Biometric Authentication'),
              value: true,
              onChanged: (bool value) {
                // Enable/Disable biometric authentication
              },
            ),
            SwitchListTile(
              title: Text('Enable App Lock'),
              value: false,
              onChanged: (bool value) {
                // Enable/Disable app lock
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Save security settings
              },
              child: Text('Save Security Settings'),
            ),
          ],
        ),
      ),
    );
  }
}

// Offline Mode Page
class OfflineModePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Offline Mode'),
        backgroundColor: Colors.green.shade700,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SwitchListTile(
              title: Text('Enable Offline Mode'),
              subtitle: Text('Work without an internet connection.'),
              value: true,
              onChanged: (bool value) {
                // Handle offline mode toggle
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Save offline mode settings
              },
              child: Text('Save Offline Settings'),
            ),
          ],
        ),
      ),
    );
  }
}
