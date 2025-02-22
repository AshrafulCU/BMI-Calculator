import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BMIResult extends StatelessWidget {
  final String bmi;

  BMIResult({required this.bmi});  // to show bmi result here

  String getBMICategory(double bmiValue) {
    if (bmiValue < 18.5) {
      return "Underweight";
    } else if (bmiValue < 24.9) {
      return "Normal weight";
    } else if (bmiValue < 29.9) {
      return "Overweight";
    } else {
      return "Obese";
    }
  }

  @override
  Widget build(BuildContext context) {
    double bmiValue = double.tryParse(bmi) ?? 0.0;
    String category = getBMICategory(bmiValue);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('BMI Result', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFFFFA000))),
            content: Text(
              'Your BMI is: $bmi\nCategory: $category',
              style: TextStyle(fontSize: 20),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK', style: TextStyle(fontSize: 18)),
              ),
            ],
          );
        },
      );
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFA000),
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(
            color: Colors.white
        ),
        title: Text(
          "BMI Score",
          style: GoogleFonts.acme(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your BMI is: $bmi',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Category: $category',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.blueAccent),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: BMIResult(bmi: '22.5'),
  ));
}
