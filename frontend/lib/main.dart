import 'package:flutter/material.dart';
import 'package:selectuser/pages/operatorReport.dart';
import 'package:selectuser/pages/selectUser.dart';

import 'backupPages/SelectUser.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        //home: SelectUser()
        home: SelectUserPage(),
        //home: OperatorReportPage(),
    );

  }
}
