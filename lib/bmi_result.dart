import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BMIResult extends StatelessWidget {
  final String bmi;

  BMIResult({required this.bmi});  // to show bmi result here

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('BMI Result', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFFFFA000))),
            content: Text(
              'Your BMI is: $bmi',
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
