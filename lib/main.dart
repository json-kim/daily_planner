import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

import './screens/detail/plan_detail_screen.dart';
import './screens/planner/planner_screen.dart';
import 'screens/add/add_plan_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('ko'),
      ],
      title: 'Daily Planner',
      theme: ThemeData(
          textTheme: GoogleFonts.nanumGothicTextTheme(),
          primarySwatch: Colors.green),
      home: PlannerScreen(),
    );
  }
}
