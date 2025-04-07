import 'package:flutter/material.dart';
import 'inspection_details.dart';

class PendingInspectionsPage extends StatefulWidget {
  const PendingInspectionsPage({super.key});

  @override
  _PendingInspectionsPageState createState() => _PendingInspectionsPageState();
}

class _PendingInspectionsPageState extends State<PendingInspectionsPage> {
  final List<Map<String, String>> pendingInspections = [
    {
      'id': 'INS001',
      'title': 'Fabric Quality',
      'date': '2025-04-10',
      'location': 'line 12',
    },
    {
      'id': 'INS002',
      'title': 'Major defects',
      'date': '2025-04-12',
      'location': 'line 5',
    },
    {
      'id': 'INS003',
      'title': 'Stitch error',
      'date': '2025-04-15',
      'location': 'line 2',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.center,
                radius: 1.5,
                colors: [Colors.green[900]!, Colors.green[200]!],
              ),
            ),
          ),

          // Custom wave pattern
          CustomPaint(
            size: Size(MediaQuery.of(context).size.width, double.infinity),
            painter: WavePainter(),
          ),

          // Content
          SafeArea(
            child: Column(
              children: [
                // Header
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.check_circle_outline,
                        color: Colors.white,
                        size: 30,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Pending Inspections',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              color: Colors.green[900]!,
                              offset: Offset(2, 2),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                if (pendingInspections.isEmpty)
                  Expanded(
                    child: Center(
                      child: Text(
                        'No Pending Inspections',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                else
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: pendingInspections.length,
                      itemBuilder: (context, index) {
                        final inspection = pendingInspections[index];
                        return InspectionCard(
                          id: inspection['id']!,
                          title: inspection['title']!,
                          date: inspection['date']!,
                          location: inspection['location']!,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => InspectionDetailsPage(
                                  inspection: inspection,
                                  onMarkAttended: () {
                                    setState(() {
                                      pendingInspections.removeWhere((item) => item['id'] == inspection['id']);
                                    });
                                  },
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Simplified Inspection Card
class InspectionCard extends StatelessWidget {
  final String id;
  final String title;
  final String date;
  final String location;
  final VoidCallback onTap;

  const InspectionCard({
    super.key,
    required this.id,
    required this.title,
    required this.date,
    required this.location,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.green[900]!,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Green vertical bar
            Container(
              width: 5,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.green[700],
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            const SizedBox(width: 12),
            // Main content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    id,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.green[700],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[900],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 16,
                        color: Colors.grey[700],
                      ),
                      const SizedBox(width: 4),
                      Text(
                        date,
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 16,
                        color: Colors.grey[700],
                      ),
                      const SizedBox(width: 4),
                      Text(
                        location,
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Arrow in circle
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green[100],
              ),
              child: Icon(
                Icons.arrow_forward,
                color: Colors.green[700],
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Wave Painter
class WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.white10
      ..style = PaintingStyle.fill;

    var path = Path()
      ..moveTo(0, size.height * 0.2)
      ..quadraticBezierTo(
        size.width * 0.25, size.height * 0.1,
        size.width * 0.5, size.height * 0.2,
      )
      ..quadraticBezierTo(
        size.width * 0.75, size.height * 0.3,
        size.width, size.height * 0.2,
      )
      ..lineTo(size.width, 0)
      ..lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
