import 'package:acc_hacks/components/constants.dart';
import 'package:acc_hacks/screen/disease_screen.dart';
import 'package:acc_hacks/screen/form_screen.dart';
import 'package:acc_hacks/screen/report_screen.dart';
import 'package:flutter/material.dart';
import 'package:acc_hacks/screen/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Acc-Health',
      theme: ThemeData(
          primarySwatch: kPrimaryColor, scaffoldBackgroundColor: kPrimaryColor),
      // home: const MyHomePage(title: 'Acc-Health'),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/disease': (context) => DiseaseScreen(),
        '/form': (context) => FormScreen(items:[], disease: "",),
        '/report': (context) => ReportScreen(parameter: 0,disease: "",)
      },
    );
  }
}
