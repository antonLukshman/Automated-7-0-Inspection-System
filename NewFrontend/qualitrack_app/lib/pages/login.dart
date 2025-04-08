// import 'package:flutter/material.dart';
// import 'select_user.dart';
// import 'cli_inspector_dashboard.dart';
// import 'supervisor_dashboard.dart';


// class LoginForm extends StatefulWidget {
//   final Color primaryColor;

//   const LoginForm({Key? key, required this.primaryColor}) : super(key: key);
  

//   @override
//   _LoginFormState createState() => _LoginFormState();
// }

// class _LoginFormState extends State<LoginForm> {
//   final _formKey = GlobalKey<FormState>();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   bool _obscurePassword = true;
 
  
//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         children: [
//           CustomTextField(
//             controller: _emailController,
//             hintText: 'Email',
//             prefixIcon: Icons.email_outlined,
//             keyboardType: TextInputType.emailAddress,
//             primaryColor: widget.primaryColor,
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter your email';
//               }
//               if (!value.contains('@') || !value.contains('.')) {
//                 return 'Please enter a valid email';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 16),
//           CustomTextField(
//             controller: _passwordController,
//             hintText: 'Password',
//             prefixIcon: Icons.lock_outline,
//             primaryColor: widget.primaryColor,
//             obscureText: _obscurePassword,
//             suffixIcon: IconButton(
//               icon: Icon(
//                 _obscurePassword
//                     ? Icons.visibility_outlined
//                     : Icons.visibility_off_outlined,
//                 color: Colors.grey,
//               ),
//               onPressed: () {
//                 setState(() {
//                   _obscurePassword = !_obscurePassword;
//                 });
//               },
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter your password';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 32),
//           SizedBox(
//             width: double.infinity,
//             height: 56,
//             child: ElevatedButton(
//               // onPressed: () {
//               //   if (_formKey.currentState!.validate()) {
//               //     // Login logic would go here
//               //     ScaffoldMessenger.of(context).showSnackBar(
//               //       SnackBar(
//               //           content: Text('Login successful!',
//               //               style: TextStyle(color: Colors.white)),
//               //           backgroundColor: widget.primaryColor),
//               //     );

//               onPressed: () {
//   if (_formKey.currentState!.validate()) {
//     // Show the SnackBar for successful login
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(
//           'Login successful!',
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: widget.primaryColor,
//       ),
//     );

//     // Check the selected user type and navigate accordingly
//     // if (_selectedUserType != null) {
//     //   if (_selectedUserType == UserType.CLIInspector) {
//     //     Navigator.push(
//     //       context,
//     //       MaterialPageRoute(
//     //         builder: (context) => InspectorDashboard(),
//     //       ),
//     //     );
//     //   } else {
//     //     Navigator.push(
//     //       context,
//     //       MaterialPageRoute(
//     //         builder: (context) => SupervisorDashboard(),
//     //       ),
//     //     );
//     //   }
//     // }
//   }
// },


                  

//                   // Navigator.push(
//                   //   context, 
//                   //   MaterialPageRoute(builder: (context) => PendingInspectionsPage()));

//               style: ElevatedButton.styleFrom(
//                 backgroundColor: widget.primaryColor,
//                 foregroundColor: Colors.white,
//                 elevation: 0,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//               ),
//               child: const Text(
//                 'Sign In',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'cli_inspector_dashboard.dart';
import 'supervisor_dashboard.dart';
import 'select_user.dart';

class LoginForm extends StatefulWidget {
  final Color primaryColor;
  final UserType userType; // Add userType parameter

  const LoginForm({
    Key? key, 
    required this.primaryColor,
    required this.userType, // Add this parameter
  }) : super(key: key);
  
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
 
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextField(
            controller: _emailController,
            hintText: 'Email',
            prefixIcon: Icons.email_outlined,
            keyboardType: TextInputType.emailAddress,
            primaryColor: widget.primaryColor,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!value.contains('@') || !value.contains('.')) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          CustomTextField(
            controller: _passwordController,
            hintText: 'Password',
            prefixIcon: Icons.lock_outline,
            primaryColor: widget.primaryColor,
            obscureText: _obscurePassword,
            suffixIcon: IconButton(
              icon: Icon(
                _obscurePassword
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Show the SnackBar for successful login
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Login successful!',
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: widget.primaryColor,
                    ),
                  );

                  // Navigate based on the user type
                  if (widget.userType == UserType.CLIInspector) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InspectorDashboard(),
                      ),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SupervisorDashboard(),
                      ),
                    );
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: widget.primaryColor,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}