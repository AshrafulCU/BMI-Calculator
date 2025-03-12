import 'dart:async';

import 'package:bmi_calculator/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  startTimer() async {
    Timer(Duration(seconds: 4), () {
      // Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
      Get.off(HomePage());
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 10,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    shape: BoxShape.circle, // Important for oval shape
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      "assets/bmilogo.png",
                      height: 150, // To adjust image size
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Text(
                  "BMI Calculator",
                  style: GoogleFonts.acme(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFA000),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10, // Adjust the position as needed
            left: 0,
            right: 0,
            child: Center(
              child: CircularProgressIndicator(
                color: Color(0xFFFFA000),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
