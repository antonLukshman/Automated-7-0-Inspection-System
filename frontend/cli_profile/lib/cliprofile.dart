import 'package:flutter/material.dart';

class Cliprofile extends StatelessWidget {
  const Cliprofile ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // Add edit profile logic
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header Section
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.white,
              child: Column(
                children: [
                  // Profile Picture
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.blue,
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Name
                  const Text(
                    'Amara Perera',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Role
                  Text(
                    'QC Inspector',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Info Section
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Personal Information',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildInfoRow(Icons.email, 'Email', 'amara25@gmail.com'),
                  _buildInfoRow(Icons.phone, 'Phone', '+94 120 201 785'),
                  _buildInfoRow(Icons.business, 'Department', 'Quality Control'),
                  _buildInfoRow(Icons.badge, 'Employee ID', 'QC1234'),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Statistics Section
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Work Statistics',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildStatRow('Inspections Completed', '156'),
                  _buildStatRow('This Month', '23'),
                  _buildStatRow('Average Rating', '4.8'),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Logout Button
            Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () {
                  // Add logout logic
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.blue,
            size: 24,
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

// File: lib/models/user_profile.dart
/*class UserProfile {
  final String email;
  final String phone;
  final String department;
  final String employeeId;

  UserProfile({
    required this.email,
    required this.phone,
    required this.department,
    required this.employeeId,
  });
}

class UserStats {
  final int inspectionsCompleted;
  final int thisMonth;
  final double averageRating;

  UserStats({
    required this.inspectionsCompleted,
    required this.thisMonth,
    required this.averageRating,
  });
}

// File: lib/screens/user_profile_screen.dart
import 'package:flutter/material.dart';
//import '../models/user_profile.dart';

class Cliprofile extends StatefulWidget {
  const Cliprofile({Key? key}) : super(key: key);

  @override
  State<Cliprofile> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<Cliprofile> {
  UserProfile? userProfile;
  UserStats? userStats;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUserData();
    _loadUserStats();
  }

  Future<void> _loadUserData() async {
    // TODO: Replace with actual API call
    // Simulating API call
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      userProfile = UserProfile(
        email: '',  // Will be filled by user
        phone: '',  // Will be filled by user
        department: '', // Will be filled by user
        employeeId: '', // Will be filled by user
      );
      isLoading = false;
    });
  }

  Future<void> _loadUserStats() async {
    // TODO: Replace with actual API call
    // Simulating API call
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      userStats = UserStats(
        inspectionsCompleted: 0, // Will come from backend
        thisMonth: 0, // Will come from backend
        averageRating: 0.0, // Will come from backend
      );
    });
  }

  Future<void> _updateUserProfile() async {
    final formKey = GlobalKey<FormState>();
    UserProfile? updatedProfile;

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Profile'),
        content: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  initialValue: userProfile?.email,
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    updatedProfile = UserProfile(
                      email: value ?? '',
                      phone: userProfile?.phone ?? '',
                      department: userProfile?.department ?? '',
                      employeeId: userProfile?.employeeId ?? '',
                    );
                  },
                ),
                TextFormField(
                  initialValue: userProfile?.phone,
                  decoration: const InputDecoration(labelText: 'Phone'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    updatedProfile = UserProfile(
                      email: updatedProfile?.email ?? userProfile?.email ?? '',
                      phone: value ?? '',
                      department: userProfile?.department ?? '',
                      employeeId: userProfile?.employeeId ?? '',
                    );
                  },
                ),
                TextFormField(
                  initialValue: userProfile?.department,
                  decoration: const InputDecoration(labelText: 'Department'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your department';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    updatedProfile = UserProfile(
                      email: updatedProfile?.email ?? userProfile?.email ?? '',
                      phone: updatedProfile?.phone ?? userProfile?.phone ?? '',
                      department: value ?? '',
                      employeeId: userProfile?.employeeId ?? '',
                    );
                  },
                ),
                TextFormField(
                  initialValue: userProfile?.employeeId,
                  decoration: const InputDecoration(labelText: 'Employee ID'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your employee ID';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    updatedProfile = UserProfile(
                      email: updatedProfile?.email ?? userProfile?.email ?? '',
                      phone: updatedProfile?.phone ?? userProfile?.phone ?? '',
                      department: updatedProfile?.department ?? userProfile?.department ?? '',
                      employeeId: value ?? '',
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (formKey.currentState?.validate() ?? false) {
                formKey.currentState?.save();
                Navigator.pop(context, true);
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );

    if (updatedProfile != null) {
      // TODO: Add API call to update profile
      setState(() {
        userProfile = updatedProfile;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: _updateUserProfile,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ... Profile header section remains the same ...

            // Info Section
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Personal Information',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildInfoRow(Icons.email, 'Email', userProfile?.email ?? 'Not set'),
                  _buildInfoRow(Icons.phone, 'Phone', userProfile?.phone ?? 'Not set'),
                  _buildInfoRow(Icons.business, 'Department', userProfile?.department ?? 'Not set'),
                  _buildInfoRow(Icons.badge, 'Employee ID', userProfile?.employeeId ?? 'Not set'),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Statistics Section
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Work Statistics',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildStatRow('Inspections Completed', '${userStats?.inspectionsCompleted ?? 0}'),
                  _buildStatRow('This Month', '${userStats?.thisMonth ?? 0}'),
                  _buildStatRow('Average Rating', '${userStats?.averageRating.toStringAsFixed(1) ?? '0.0'}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

// ... _buildInfoRow and _buildStatRow methods remain the same ...
}*/