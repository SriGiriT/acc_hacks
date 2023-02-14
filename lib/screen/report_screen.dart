import 'dart:math';
import 'package:flutter/material.dart';

class ReportScreen extends StatelessWidget {
  final int parameter;
  final String disease;

  ReportScreen({required this.parameter, required this.disease});

  @override
  Widget build(BuildContext context) {
    var rng = new Random();
    String score = "";
    String description = "";

    if (parameter == 1) {
      score = "YES";
      description = "Probably Have Risk Of " + disease;
    } else {
      score = "NO";
      description = "No Symptom Of "+disease;
    }

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Report"),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150.0,
              height: 150.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 44, 60, 106),
              ),
              child: Center(
                child: Text(
                  score.toString(),
                  style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              description,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
