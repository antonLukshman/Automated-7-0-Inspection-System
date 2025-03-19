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
    'Total Inspections done': 30,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Top SVG buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.settings), // Replace with your SVG
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(
                        Icons.notifications), // Replace with your SVG
                    onPressed: () {},
                  ),
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
                  color: AppColors.textSecondary
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
                  )),

              const Spacer(),

              // Bottom SVG buttons
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
                        Icons.camera_alt_outlined), // Replace with your SVG
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
                        : Colors.grey,
                         // Selected color
                    
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
