import 'package:flutter/material.dart';
import 'package:qualitrack_app/pages/pending_inspections.dart';
import 'package:qualitrack_app/pages/profile.dart';
import 'package:qualitrack_app/pages/select_user.dart';

import 'package:qualitrack_app/pages/settings.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, // This removes the debug banner
  
        home: SelectUserPage());
        //home: PendingInspectionsPage());
        //home: ProfilePage());
        //home: SettingsPage());
        
  }
}


