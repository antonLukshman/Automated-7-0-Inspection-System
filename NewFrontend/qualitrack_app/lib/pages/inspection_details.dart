import 'package:flutter/material.dart';

class InspectionDetailsPage extends StatefulWidget {
  final Map<String, String> inspection;
  final VoidCallback onMarkAttended;

  const InspectionDetailsPage({
    super.key,
    required this.inspection,
    required this.onMarkAttended,
  });

  @override
  _InspectionDetailsPageState createState() => _InspectionDetailsPageState();
}

class _InspectionDetailsPageState extends State<InspectionDetailsPage> {
  bool isAttended = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.green[800]!, Colors.green[200]!],
              ),
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(Icons.arrow_back,
                              color: Colors.green[700]),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            widget.inspection['title']!,
                            style: const TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green[900]!,
                          blurRadius: 15,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: Colors.green[100],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                'ID: ${widget.inspection['id']}',
                                style: TextStyle(color: Colors.green[700]),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: isAttended ? Colors.green[100] : Colors.orange[100],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                isAttended ? 'Attended' : 'Pending',
                                style: TextStyle(color: isAttended ? Colors.green : Colors.orange),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        CreativeDetailRow(
                          icon: Icons.calendar_today,
                          label: 'Date',
                          value: widget.inspection['date']!,
                        ),
                        CreativeDetailRow(
                          icon: Icons.location_on,
                          label: 'Location',
                          value: widget.inspection['location']!,
                        ),
                        CreativeDetailRow(
                          icon: Icons.person,
                          label: 'Operator',
                          value: 'John Doe',
                        ),

                        const SizedBox(height: 30),

                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              if (!isAttended) {
                                setState(() {
                                  isAttended = true;
                                });
                                widget.onMarkAttended();
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: isAttended ? Colors.grey : Colors.green[700],
                              padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(isAttended ? Icons.check : Icons.check, color: Colors.white),
                                const SizedBox(width: 10),
                                Text(
                                  isAttended ? 'Attended' : 'Mark as Attended',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Creative Detail Row
class CreativeDetailRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const CreativeDetailRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.green[700],
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: Colors.green[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
