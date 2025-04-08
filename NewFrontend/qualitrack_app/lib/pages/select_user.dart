import 'package:flutter/material.dart';
import 'forgot_password.dart';
import 'signup.dart';
import 'login.dart';

// User Types
enum UserType {
  CLIInspector,
  Supervisor,
}

// User Type Selection Screen
class SelectUserPage extends StatefulWidget {
  const SelectUserPage({Key? key}) : super(key: key);

  @override
  _UserTypeSelectionScreenState createState() =>
      _UserTypeSelectionScreenState();
}

class _UserTypeSelectionScreenState extends State<SelectUserPage>
    with SingleTickerProviderStateMixin {
  UserType? _selectedUserType;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Color getPrimaryColor() {
    return _selectedUserType == UserType.CLIInspector
        ? const Color(0xFF4CAF50) // Green for User A
        : const Color(0xFF2196F3); // Blue for User B
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFF5F5F5), Color(0xFFE0E0E0)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                const Text(
                  'Welcome!',
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF333333),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Please select your user type to continue',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF666666),
                  ),
                ),
                const SizedBox(height: 60),
                Expanded(
                  child: Center(
                    child: Row(
                      children: [
                        Expanded(
                          child: UserTypeCard(
                            title: 'CLI Inspector',
                            description:
                                'Access green-themed features and tools',
                            color: const Color(0xFF4CAF50),
                            secondaryColor: const Color(0xFFE8F5E9),
                            isSelected:
                                _selectedUserType == UserType.CLIInspector,
                            icon: Icons.eco_outlined,
                            onTap: () {
                              setState(() {
                                _selectedUserType = UserType.CLIInspector;
                                _animationController.reset();
                                _animationController.forward();
                              });
                            },
                            scaleAnimation: _scaleAnimation,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: UserTypeCard(
                            title: 'Supervisor',
                            description: 'Access standard features and tools',
                            color: const Color(0xFF2196F3),
                            secondaryColor: const Color(0xFFE3F2FD),
                            isSelected:
                                _selectedUserType == UserType.Supervisor,
                            icon: Icons.person_outlined,
                            onTap: () {
                              setState(() {
                                _selectedUserType = UserType.Supervisor;
                                _animationController.reset();
                                _animationController.forward();
                              });
                            },
                            scaleAnimation: _scaleAnimation,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: _selectedUserType != null
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    AuthScreen(userType: _selectedUserType!),
                                    //LoginForm(primaryColor: primaryColor)
                              ),
                            );
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          _selectedUserType == UserType.CLIInspector
                              ? const Color(0xFF4CAF50)
                              : _selectedUserType == UserType.Supervisor
                                  ? const Color(0xFF2196F3)
                                  : Colors.grey,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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

class UserTypeCard extends StatelessWidget {
  final String title;
  final String description;
  final Color color;
  final Color secondaryColor;
  final bool isSelected;
  final IconData icon;
  final VoidCallback onTap;
  final Animation<double> scaleAnimation;

  const UserTypeCard({
    Key? key,
    required this.title,
    required this.description,
    required this.color,
    required this.secondaryColor,
    required this.isSelected,
    required this.icon,
    required this.onTap,
    required this.scaleAnimation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: isSelected ? scaleAnimation.value : 1.0,
          child: child,
        );
      },
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          height: 200,
          decoration: BoxDecoration(
            color: isSelected ? secondaryColor : Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: isSelected
                    ? color.withOpacity(0.3)
                    : Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
            border: Border.all(
              color: isSelected ? color : Colors.transparent,
              width: 2,
            ),
          ),
          child: Stack(
            children: [
              if (isSelected)
                Positioned(
                  top: -15,
                  right: -15,
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: color.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        icon,
                        color: color,
                        size: 32,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF333333),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              if (isSelected)
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

// Authentication Screen (Login/Register toggle)
class AuthScreen extends StatefulWidget {
  final UserType userType;

  const AuthScreen({Key? key, required this.userType}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _isLogin = true;

  Color get _primaryColor {
    return widget.userType == UserType.CLIInspector
        ? const Color(0xFF4CAF50) // Green for User A
        : const Color(0xFF2196F3); // Blue for User B
  }

  Color get _lightColor {
    return widget.userType == UserType.CLIInspector
        ? const Color(0xFFE8F5E9) // Light green for User A
        : const Color(0xFFE3F2FD); // Light blue for User B
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white,
              _lightColor.withOpacity(0.3),
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: _primaryColor),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(
                        widget.userType == UserType.CLIInspector
                            ? Icons.eco_outlined
                            : Icons.person_outlined,
                        color: _primaryColor,
                        size: 32,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        widget.userType == UserType.CLIInspector
                            ? 'CLI Inspector'
                            : 'Supervisor',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: _primaryColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Text(
                    _isLogin ? 'Welcome Back!' : 'Create Account',
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    _isLogin
                        ? 'Please sign in to continue'
                        : 'Please fill in your details',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF666666),
                    ),
                  ),
                  const SizedBox(height: 40),
                  _isLogin
                      ? LoginForm(
                          primaryColor: _primaryColor,
                          userType: widget.userType, // Pass the userType here
                        )
                      : SignupForm(primaryColor: _primaryColor),
                  const SizedBox(height: 20),
                  if (_isLogin)
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForgotPasswordScreen(
                                  userType: widget.userType),
                            ),
                          );
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: _primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _isLogin
                            ? "Don't have an account? "
                            : "Already have an account? ",
                        style: const TextStyle(
                          color: Color(0xFF666666),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isLogin = !_isLogin;
                          });
                        },
                        child: Text(
                          _isLogin ? 'Sign Up' : 'Sign In',
                          style: TextStyle(
                            color: _primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


// Custom Text Field Widget
class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Color primaryColor;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    required this.primaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      style: const TextStyle(fontSize: 16),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey[400]),
        prefixIcon: Icon(
          prefixIcon,
          color: Colors.grey,
        ),
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: Colors.grey[100],
        contentPadding: const EdgeInsets.all(20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: primaryColor, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
      ),
    );
  }
}
