import 'package:flutter/material.dart';
import '/pages/login.dart';
import '../styles/app_styles.dart';

class SelectUserPage extends StatefulWidget {
  const SelectUserPage({super.key});

  @override
  State<SelectUserPage> createState() => _SelectUserPageState();
}

class _SelectUserPageState extends State<SelectUserPage> {
  String? _selectedRole; // storing the selected role

  // handling role selection
  void _handleButtonPress(String role) {
    setState(() {
      _selectedRole = role;
    });
  }

  // navigating to the next page
  void _navigateToNextPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Select User Type',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // first button (CLI Inspector)
                    ElevatedButton(
                      onPressed: () {
                        if (_selectedRole == 'CLI Inspector') {
                          setState(() {
                            _selectedRole =
                                null; // deselect if already selected
                          });
                        } else {
                          _handleButtonPress('CLI Inspector');
                        }
                      },
                      style: _selectedRole == 'CLI Inspector'
                          ? AppStyles.deselecButtonStyle
                          : AppStyles.selecButtonStyle,
                      child: const Text('CLI Inspector'),
                    ),
                    const SizedBox(width: 66),
                    // second button (Supervisor)
                    ElevatedButton(
                      onPressed: () {
                        if (_selectedRole == 'Supervisor') {
                          setState(() {
                            _selectedRole =
                                null; // deselect if already selected
                          });
                        } else {
                          _handleButtonPress('Supervisor');
                        }
                      },
                      style: _selectedRole == 'Supervisor'
                          ? AppStyles.deselecButtonStyle
                          : AppStyles.selecButtonStyle,
                      child: const Text('Supervisor'),
                    ),
                  ],
                ),
                const SizedBox(height: 60),
                // next button, only enabled when a role is selected
                ElevatedButton(
                  onPressed: _selectedRole == null ? null : _navigateToNextPage,
                  style: AppStyles.primaryButtonStyle,
                  child: const Text(
                    'Next',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
