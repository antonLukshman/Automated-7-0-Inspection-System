import 'package:flutter/material.dart';
import 'flag_raised_screen.dart';
import 'profile_screen.dart';
import '/widgets/flag_form.dart';

class FlagScreen extends StatelessWidget {
  const FlagScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flag Screen'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const FlagForm(),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(16),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FlagRaisedScreen()),
                );
              },
              child: const Icon(Icons.flag, color: Colors.white, size: 30),
            ),
          ],
        ),
      ),
    );
  }
}
