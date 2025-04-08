import 'package:flutter/material.dart';
import 'package:qualitrack_app/pages/pending_inspections.dart';
import 'package:qualitrack_app/pages/profile.dart';
import 'package:qualitrack_app/pages/select_user.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, // This removes the debug banner
  
        //home: UserTypeSelectionScreen());
        home: PendingInspectionsPage());
        //home: ProfilePage());
  }
}

// import 'package:flutter/material.dart';
// import 'package:qualitrack_app/pages/pending_inspections.dart';  // Import your pending inspections page
// import 'package:qualitrack_app/pages/select_user.dart';         // Import your select user page
// import 'package:qualitrack_app/pages/inspection_details.dart'; // Import the inspection details page

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,  // This removes the debug banner
//       initialRoute: '/selectUser',        // Set the initial route (change as needed)
//       routes: {
//         '/selectUser': (context) => const UserTypeSelectionScreen(),
//         '/pending': (context) => const PendingInspectionsPage(),
//         '/inspectionDetails': (context) => const InspectionDetailsPage(),
//       },
//     );
//   }
// }
