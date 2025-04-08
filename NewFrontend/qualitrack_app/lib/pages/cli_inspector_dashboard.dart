import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'supervisor_dashboard.dart';
import 'settings.dart';
import 'profile.dart';

// Only keep the InspectorDashboard class and related components

class StatItem {
  final String title;
  final String value;
  final String description;
  final IconData icon;
  final Color color;

  StatItem({
    required this.title,
    required this.value,
    required this.description,
    required this.icon,
    required this.color,
  });
}

// ========================= INSPECTOR DASHBOARD (USER A) =========================

class InspectorDashboard extends StatefulWidget {
  @override
  _InspectorDashboardState createState() => _InspectorDashboardState();
}

class _InspectorDashboardState extends State<InspectorDashboard> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _tabs = ['Dashboard', 'New Inspection', 'History', 'Profile'];
  final Color primaryColor = const Color(0xFF4CAF50);
  final Color secondaryColor = const Color(0xFFE8F5E9);
  int _selectedIndex = 0;
  List<Map<String, dynamic>> tasks = [
    {'name': 'Cotton Fabric Batch #4578', 'time': '09:30 AM', 'completed': false},
    {'name': 'Polyester Blend #7823', 'time': '11:00 AM', 'completed': false},
    {'name': 'Denim Batch #3321', 'time': '01:30 PM', 'completed': false},
    {'name': 'Wool Blend #9945', 'time': '03:00 PM', 'completed': false},
    {'name': 'Silk Fabric #2278', 'time': '04:30 PM', 'completed': false},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _toggleTaskCompletion(int index) {
    setState(() {
      tasks[index]['completed'] = !tasks[index]['completed'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: _selectedIndex == 0
                ? _buildInspectorDashboardTab()
                : _selectedIndex == 1
                    ? Center(child: Text('New Inspection View'))
                    : _selectedIndex == 2
                        ? Center(child: Text('History View'))
                        : Center(child: Text('Profile View')),
          ),
          Positioned(
            top: 20,
            right: 20,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.settings, color: Color(0xFF333333)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SettingsPage()),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.person, color: Color(0xFF333333)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfilePage()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: primaryColor,
        child: const Icon(Icons.add_photo_alternate_outlined),
        tooltip: 'New Inspection',
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_arrow),
            label: 'Start Inspection',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Stats',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildInspectorDashboardTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInspectorWelcomeCard(),
          const SizedBox(height: 24),
          _buildInspectorStats(),
          const SizedBox(height: 24),
          _buildDailyTasksCard(),
          const SizedBox(height: 24),
          _buildRecentInspections(),
        ],
      ),
    );
  }

  Widget _buildInspectorWelcomeCard() {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [primaryColor, primaryColor.withOpacity(0.8)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Welcome back, John!',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    DateFormat('MMM d, yyyy').format(DateTime.now()),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'You have 5 inspections scheduled for today',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildInspectorQuickButton(Icons.add_task, 'New\nInspection'),
                _buildInspectorQuickButton(Icons.checklist, 'Daily\nTasks'),
                _buildInspectorQuickButton(Icons.history, 'Recent\nHistory'),
                _buildInspectorQuickButton(Icons.camera_alt, 'Quick\nScan'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInspectorQuickButton(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: Colors.white, size: 24),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildInspectorStats() {
    final List<StatItem> stats = [
      StatItem(
        title: 'Today\'s Tasks',
        value: '5',
        description: 'Pending inspections',
        icon: Icons.check_circle_outline,
        color: primaryColor,
      ),
      StatItem(
        title: 'Completed',
        value: '3',
        description: 'Inspections today',
        icon: Icons.task_alt,
        color: primaryColor,
      ),
      StatItem(
        title: 'Defects Found',
        value: '27',
        description: 'In last 5 inspections',
        icon: Icons.bug_report_outlined,
        color: primaryColor,
      ),
      StatItem(
        title: 'Total Hours',
        value: '24.5',
        description: 'Inspection time this week',
        icon: Icons.access_time,
        color: primaryColor,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Your Statistics',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF333333),
          ),
        ),
        const SizedBox(height: 16),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 1.3,
          ),
          itemCount: stats.length,
          itemBuilder: (context, index) {
            return _buildInspectorStatCard(stats[index]);
          },
        ),
      ],
    );
  }

  Widget _buildInspectorStatCard(StatItem stat) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                stat.icon,
                color: primaryColor,
                size: 24,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              stat.value,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              stat.title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF333333),
              ),
            ),
            Text(
              stat.description,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDailyTasksCard() {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Daily Tasks',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF333333),
                  ),
                ),
                Text(
                  '${tasks.where((task) => task['completed'] == true).length}/${tasks.length} Completed',
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...tasks.map((task) => _buildTaskItem(
              name: task['name'].toString(),
              time: task['time'].toString(),
              completed: task['completed'] as bool,
              onTap: () => _toggleTaskCompletion(tasks.indexOf(task)),
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskItem({required String name, required String time, required bool completed, required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: completed ? primaryColor : Colors.transparent,
                borderRadius: BorderRadius.circular(6),
                border: completed ? null : Border.all(color: Colors.grey),
              ),
              child: completed
                  ? const Icon(Icons.check, color: Colors.white, size: 16)
                  : null,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: completed ? Colors.grey : const Color(0xFF333333),
                    decoration: completed ? TextDecoration.lineThrough : null,
                  ),
                ),
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.camera_alt_outlined,
              color: primaryColor,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildRecentInspections() {
    final inspections = [
      {
        'id': 'INS-4578',
        'fabric': 'Cotton',
        'defects': 8,
        'timeAgo': '2 hours ago',
        'status': 'Completed'
      },
      {
        'id': 'INS-4577',
        'fabric': 'Polyester',
        'defects': 3,
        'timeAgo': '4 hours ago',
        'status': 'Completed'
      },
      {
        'id': 'INS-4576',
        'fabric': 'Denim',
        'defects': 16,
        'timeAgo': '5 hours ago',
        'status': 'Completed'
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Recent Inspections',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF333333),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'View All',
                style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ...inspections.map((inspection) => _buildInspectionItem(inspection)),
      ],
    );
  }

  Widget _buildInspectionItem(Map<String, dynamic> inspection) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Icon(
                  Icons.description_outlined,
                  color: primaryColor,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${inspection['id']} - ${inspection['fabric']} Fabric',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF333333),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${inspection['defects']} defects found • ${inspection['timeAgo']}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'View',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

