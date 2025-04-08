import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'package:qualitrack_app/pages/profile.dart';
import 'package:qualitrack_app/pages/settings.dart';

class SupervisorDashboard extends StatefulWidget {
  @override
  _SupervisorDashboardState createState() => _SupervisorDashboardState();
}

class _SupervisorDashboardState extends State<SupervisorDashboard>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _tabs = ['Overview', 'Analytics', 'Team', 'Settings'];
  final Color primaryColor = const Color(0xFF2196F3);
  final Color secondaryColor = const Color(0xFFE3F2FD);
  int _selectedIndex = 0;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child:
                _selectedIndex == 0
                    ? _buildSupervisorDashboardTab()
                    : _selectedIndex == 1
                    ? Center(child: Text('Analytics View'))
                    : _selectedIndex == 2
                    ? Center(child: Text('Team View'))
                    : Center(child: Text('Settings View')),
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
        child: const Icon(Icons.add),
        tooltip: 'New Report',
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Pending Inspections',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Stats'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildSupervisorDashboardTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSupervisorWelcomeCard(),
          const SizedBox(height: 24),
          _buildSupervisorStats(),
          const SizedBox(height: 24),
          _buildDefectTrendChart(),
          const SizedBox(height: 24),
          _buildDefectTypeDistribution(),
          const SizedBox(height: 24),
          _buildTeamPerformance(),
        ],
      ),
    );
  }

  Widget _buildSupervisorWelcomeCard() {
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
                  'Welcome back, Mark!',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
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
              'Factory production quality is 95.6% this week',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSupervisorQuickButton(
                  Icons.dashboard,
                  'Production\nOverview',
                ),
                _buildSupervisorQuickButton(
                  Icons.trending_up,
                  'Quality\nAnalytics',
                ),
                _buildSupervisorQuickButton(Icons.group, 'Team\nReports'),
                _buildSupervisorQuickButton(Icons.settings, 'System\nSettings'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSupervisorQuickButton(IconData icon, String label) {
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

  Widget _buildSupervisorStats() {
    final List<StatItem> stats = [
      StatItem(
        title: 'Total Inspections',
        value: '127',
        description: 'This month',
        icon: Icons.assignment_outlined,
        color: primaryColor,
      ),
      StatItem(
        title: 'Defect Rate',
        value: '4.4%',
        description: 'vs 5.7% last month',
        icon: Icons.bug_report_outlined,
        color: primaryColor,
      ),
      StatItem(
        title: 'Production Efficiency',
        value: '92%',
        description: 'Up 3% from last week',
        icon: Icons.speed_outlined,
        color: primaryColor,
      ),
      StatItem(
        title: 'Active Inspectors',
        value: '8',
        description: '2 on leave today',
        icon: Icons.people_outline,
        color: primaryColor,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Factory Overview',
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
            return _buildSupervisorStatCard(stats[index]);
          },
        ),
      ],
    );
  }

  Widget _buildSupervisorStatCard(StatItem stat) {
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
              child: Icon(stat.icon, color: primaryColor, size: 24),
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
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDefectTrendChart() {
    // Sample data for the chart
    final List<WeeklyDefectData> defectData = [
      WeeklyDefectData('Week 1', 34),
      WeeklyDefectData('Week 2', 42),
      WeeklyDefectData('Week 3', 28),
      WeeklyDefectData('Week 4', 32),
      WeeklyDefectData('Week 5', 24),
      WeeklyDefectData('Week 6', 18),
    ];

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Defect Trend (Last 6 Weeks)',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF333333),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Overall defect rate is declining',
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 200,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    horizontalInterval: 10,
                    getDrawingHorizontalLine: (value) {
                      return FlLine(
                        color: const Color(0xFFE0E0E0),
                        strokeWidth: 1,
                      );
                    },
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 22,
                        getTitlesWidget: (value, meta) {
                          final int index = value.toInt();
                          if (index >= 0 && index < defectData.length) {
                            return Text(
                              defectData[index].week,
                              style: const TextStyle(
                                color: Color(0xFF333333),
                                fontSize: 12,
                              ),
                            );
                          }
                          return const Text('');
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          if (value % 10 == 0) {
                            return Text(
                              '${value.toInt()}',
                              style: const TextStyle(
                                color: Color(0xFF333333),
                                fontSize: 12,
                              ),
                            );
                          }
                          return const Text('');
                        },
                        reservedSize: 28,
                      ),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  minX: 0,
                  maxX: defectData.length - 1.0,
                  minY: 0,
                  maxY: 50,
                  lineBarsData: [
                    LineChartBarData(
                      spots:
                          defectData.asMap().entries.map((entry) {
                            return FlSpot(
                              entry.key.toDouble(),
                              entry.value.defectCount.toDouble(),
                            );
                          }).toList(),
                      isCurved: true,
                      color: primaryColor,
                      barWidth: 3,
                      isStrokeCapRound: true,
                      dotData: FlDotData(
                        show: true,
                        getDotPainter: (spot, percent, barData, index) {
                          return FlDotCirclePainter(
                            radius: 4,
                            color: primaryColor,
                            strokeWidth: 2,
                            strokeColor: Colors.white,
                          );
                        },
                      ),
                      belowBarData: BarAreaData(
                        show: true,
                        color: primaryColor.withOpacity(0.2),
                        gradient: LinearGradient(
                          colors: [
                            primaryColor.withOpacity(0.3),
                            primaryColor.withOpacity(0.1),
                          ],
                          stops: const [0.5, 1.0],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDefectTypeDistribution() {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Defect Type Distribution',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF333333),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'This month\'s quality issues by category',
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            const SizedBox(height: 20),
            _buildDefectTypeItem('Color Variation', 35, 0.35),
            const SizedBox(height: 16),
            _buildDefectTypeItem('Thread Tension', 27, 0.27),
            const SizedBox(height: 16),
            _buildDefectTypeItem('Material Flaws', 18, 0.18),
            const SizedBox(height: 16),
            _buildDefectTypeItem('Stitching Issues', 12, 0.12),
            const SizedBox(height: 16),
            _buildDefectTypeItem('Other Defects', 8, 0.08),
          ],
        ),
      ),
    );
  }

  Widget _buildDefectTypeItem(String type, int count, double percentage) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              type,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xFF333333),
              ),
            ),
            Text(
              '$count',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Stack(
          children: [
            Container(
              height: 8,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            FractionallySizedBox(
              widthFactor: percentage,
              child: Container(
                height: 8,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTeamPerformance() {
    final teamMembers = [
      {
        'name': 'John Doe',
        'role': 'Senior Inspector',
        'inspections': 42,
        'efficiency': 96,
        'avatar': 'JD',
      },
      {
        'name': 'Sarah Johnson',
        'role': 'Quality Expert',
        'inspections': 38,
        'efficiency': 94,
        'avatar': 'SJ',
      },
      {
        'name': 'Mike Chen',
        'role': 'Inspector',
        'inspections': 35,
        'efficiency': 91,
        'avatar': 'MC',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Top Performers',
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
        ...teamMembers.map((member) => _buildTeamMemberItem(member)),
      ],
    );
  }

  Widget _buildTeamMemberItem(Map<String, dynamic> member) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: primaryColor,
              child: Text(
                member['avatar'].toString(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    member['name'].toString(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF333333),
                    ),
                  ),
                  Text(
                    member['role'].toString(),
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${member['inspections']} inspections',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF333333),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '${member['efficiency']}% efficiency',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: primaryColor,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(Icons.arrow_upward, color: primaryColor, size: 16),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

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

class WeeklyDefectData {
  final String week;
  final int defectCount;

  WeeklyDefectData(this.week, this.defectCount);
}
