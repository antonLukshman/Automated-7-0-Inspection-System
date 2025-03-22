import 'package:flutter/material.dart';

import 'pages/selectUser.dart';
import 'styles/app_styles.dart';
// import 'package:flutter_application_qualitrack/pages/operatorDetails.dart';
// import 'package:flutter_application_qualitrack/pages/operatorReport.dart';
// import 'package:flutter_application_qualitrack/pages/pendingInspections.dart';
// import 'package:flutter_application_qualitrack/pages/selectUser.dart';
// import 'package:flutter_application_qualitrack/styles/custom_textfields.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {q
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, // This removes the debug banner
        //theme: CustomTextFieldTheme.getThemeData(),
        home: SelectUserPage());
        //home: OperatorReportPage());
        //home: OperatordetailsPage());
        //home: FlaggedReportsPage());
  }
}