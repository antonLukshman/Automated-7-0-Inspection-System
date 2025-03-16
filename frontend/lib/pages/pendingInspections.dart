import 'package:flutter/material.dart';

import '../styles/app_styles.dart';


class FlaggedReportsPage extends StatefulWidget {
  const FlaggedReportsPage({super.key});

  @override
  State<FlaggedReportsPage> createState() => _FlaggedReportsState();
}

class _FlaggedReportsState extends State<FlaggedReportsPage> {

    int _selectedIndex = 1; // Track the selected icon

  void _onIconPressed(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Flagged Reports'),
        centerTitle: true, // Centers the title in the app bar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Add padding around the content
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center vertically
            crossAxisAlignment:
                CrossAxisAlignment.center, // Center horizontally
            children: [
              ContainerStyle.reusableContainer(
                child: TextButton(
                  onPressed: () => {},
                  child: Text(
                    "Operator ID: ",
                    style: TextStyle(fontSize: 18), // Custom text style
                  ),
                ),
              ),
              SizedBox(height: 20), // Add space between elements
              ContainerStyle.reusableContainer(
                child: TextButton(
                  onPressed: () => {},
                  child: Text(
                    "Operator ID: ",
                    style: TextStyle(fontSize: 18), // Custom text style
                  ),
                ),
              ),
              SizedBox(height: 20), // Add space between elements
              ContainerStyle.reusableContainer(
                child: TextButton(
                  onPressed: () => {},
                  child: Text(
                    "Operator ID: ",
                    style: TextStyle(fontSize: 18), // Custom text style
                  ),
                ),
              ),

              SizedBox(height: 20), // Add space between elements
              ContainerStyle.reusableContainer(
                child: TextButton(
                  onPressed: () => {},
                  child: Text(
                    "Operator ID: ",
                    style: TextStyle(fontSize: 18), // Custom text style
                  ),
                ),
              ),

              Spacer(),
                            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: const Icon(Icons.home), // Replace with your SVG
                    iconSize: _selectedIndex == 0
                        ? 40
                        : 30, // Bigger size for selected
                    color: _selectedIndex == 0
                        ? const Color.fromARGB(255, 241, 44, 70)
                        : Colors.grey, // Selected color
                    onPressed: () => _onIconPressed(0),
                  ),
                  IconButton(
                    icon: const Icon(
                        Icons.error), // Replace with your SVG
                    iconSize: _selectedIndex == 1
                        ? 40
                        : 30, // Bigger size for selected
                    color: _selectedIndex == 1
                        ? const Color.fromARGB(255, 243, 33, 33)
                        : Colors.grey, // Selected color
                    onPressed: () => _onIconPressed(1),
                  ),
                  IconButton(
                    icon: const Icon(Icons.person), // Replace with your SVG
                    iconSize: _selectedIndex == 2
                        ? 40
                        : 30, // Bigger size for selected
                    color: _selectedIndex == 2
                        ? const Color.fromARGB(255, 244, 33, 36)
                        : Colors.grey, // Selected color
                    onPressed: () => _onIconPressed(2),
                  ),
                ],
              ),
            ],
          ),
    
        ),
      ),
    );
  }
}
