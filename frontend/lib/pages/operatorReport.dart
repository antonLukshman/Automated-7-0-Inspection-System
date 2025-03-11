import 'package:flutter/material.dart';
import 'package:flutter_application_qualitrack/styles/app_styles.dart';

class OperatorReportPage extends StatelessWidget {
  const OperatorReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        
        title: Text(
          "Operator Report",
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          // container to add background color and padding
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: const Color.fromARGB(
                255, 145, 189, 221), // Background color for the container
            borderRadius: BorderRadius.circular(12), // Rounded corners
            boxShadow: [
              BoxShadow(
                color: Colors.black26, // Shadow color
                offset: Offset(0, 4), // Shadow offset
                blurRadius: 4, // Blur radius of the shadow
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ContainerStyle.reusableContainer(
                    child: Text(
                      'Operator Name:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ContainerStyle.reusableContainer2(
                    child: Text(
                      'Jerry Tom',
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                ],
              ),
              Divider(),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ContainerStyle.reusableContainer(
                    child: Text(
                      'Machine No:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ContainerStyle.reusableContainer2(
                    child: Text(
                      'm123456',
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                ],
              ),
              Divider(),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ContainerStyle.reusableContainer(
                    child: Text(
                      'Total Defects:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ContainerStyle.reusableContainer2(
                    child: Text(
                      '62',
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                ],
              ),
              Divider(),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ContainerStyle.reusableContainer(
                    child: Text(
                      'Times Atttended:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ContainerStyle.reusableContainer2(
                    child: Text(
                      '20',
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                ],
              ),
              Divider(),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ContainerStyle.reusableContainer(
                    child: Text(
                      'Defect Rate:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ContainerStyle.reusableContainer2(
                    child: Text(
                      '12%',
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                ],
              ),
              Divider(),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ContainerStyle.reusableContainer(
                    child: Text(
                      'Flag Count:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ContainerStyle.reusableContainer2(
                    child: Text(
                      '25',
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                ],
              ),
              Divider(),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ContainerStyle.reusableContainer(
                    child: Text(
                      'Supervisor In Charge:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ContainerStyle.reusableContainer2(
                    child: Text(
                      'Tom Jerry',
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                ],
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
