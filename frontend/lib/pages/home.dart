import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../styles/app_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Track the selected icon

  void _onIconPressed(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
  }

  // Sample data for the pie chart
  List<PieChartSectionData> sections = [
    PieChartSectionData(
      value: 30,
      title: '30%',
      color: Colors.blue,
      radius: 100,
    ),
    PieChartSectionData(
      value: 40,
      title: '40%',
      color: Colors.red,
      radius: 100,
    ),
    PieChartSectionData(
      value: 30,
      title: '30%',
      color: Colors.green,
      radius: 100,
    ),
  ];

  // Sample data for variables
  Map<String, double> variables = {
    'Total Inspections donee': 30,
    'Total flags raised': 40,
    'Defect percentage': 30,
  };

  void updateChartData(String variable, double newValue) {
    setState(() {
      variables[variable] = newValue;

      // Update pie chart sections
      int index = variables.keys.toList().indexOf(variable);
      sections[index] = PieChartSectionData(
        value: newValue,
        title: '${newValue.toInt()}%',
        color: [Colors.blue, Colors.red, Colors.green][index],
        radius: 100,
      );
    });
  }

    
    Widget _buildIconButton(int index, IconData icon) {
    return GestureDetector(
      onTap: () => _onIconPressed(index), // Handle icon press
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: _selectedIndex == index
              ? AppColors.secondaryBackground
              : Colors.transparent, // Optional: background color when selected
          borderRadius: BorderRadius.circular(50), // Round the corners
          boxShadow: _selectedIndex == index
              ? [
                  BoxShadow(
                    color: Colors.blueAccent.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 6,
                    offset: Offset(0, 3), // Shadow position
                  ),
                ]
              : [], // No shadow when not selected
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0), // Padding inside the icon button
          child: Icon(
            icon,
            size:
                _selectedIndex == index ? 40 : 30, // Larger icon when selected
            color: _selectedIndex == index
                ? Colors.blueAccent // Color when selected
                : Colors.grey, // Default color when not selected
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildIconButton(4, Icons.settings),
                  _buildIconButton(5, Icons.notifications),
                ],
              ),

              const SizedBox(height: 20),

              // Title text
              const Text(
                'Daily Report',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  //color: Colors.black
                  //color: AppColors.textSecondary
                ),
              ),

              const SizedBox(height: 60),

              // Pie Chart
              SizedBox(
                height: 200,
                child: PieChart(
                  PieChartData(
                    sections: sections,
                    centerSpaceRadius: 0,
                    sectionsSpace: 2,
                  ),
                ),
              ),

              const SizedBox(height: 60),

              // Variables and values
              ...variables.entries.map((entry) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                       width: double.infinity, // Ensure the container spans the full width
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0), // Add vertical padding
                      decoration: BoxDecoration(
                        color: AppColors
                            .primary, // Set your desired background color here
                        borderRadius: BorderRadius.circular(
                            10), // Optional: rounded corners
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ContainerStyle.reusableContainer(
                            child: Text(
                              entry.key,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          ContainerStyle.reusableContainer2(
                            child: Text(
                              '${entry.value.toInt()}%',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )),

              const Spacer(),

              // Bottom SVG buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                                    _buildIconButton(0, Icons.home),
                  _buildIconButton(1, Icons.camera_alt_outlined),
                  _buildIconButton(2, Icons.person),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
