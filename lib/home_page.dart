import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'bmi_result.dart'; // Import the BMIResult screen

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var firstController = TextEditingController();
  var secondController = TextEditingController();
  var result = "0".obs;

  void sum(String weightKg, String heightFeet) {
    double weight = double.parse(weightKg);
    double heightInFeet = double.parse(heightFeet);
    double heightInMeters = heightInFeet * 0.3048;
    double bmi = weight / (heightInMeters * heightInMeters);
   // double bmiValue = double.parse(result.value);

    result.value = bmi.toStringAsFixed(2);
    // Navigate to the BMIResult screen
    Get.to(() => BMIResult(bmi: result.value)); // to show result another page
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFA000),
        automaticallyImplyLeading: false,
        title: Text(
          "BMI Calculator",
          style: GoogleFonts.acme(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),

      ),
      body: SingleChildScrollView(
        child: Center(
        
          child: Column(
        
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
        
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  constraints: BoxConstraints(
                    maxHeight: 250,
                    maxWidth: MediaQuery.of(context).size.width * 0.8,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.all(20),
                  child: Lottie.asset('assets/animation.json'),
                ),
              ),
        
              SizedBox(height: 20),
              // TextField(
              //   keyboardType: TextInputType.number,
              //   controller: firstController,
              //   decoration: InputDecoration(
              //     border: OutlineInputBorder(),
              //     labelText: "(Enter Your Weight in KG)",
              //     hintText: "0",
              //     prefixIcon: Icon(Icons.numbers_sharp),
              //   ),
              // ),
              // SizedBox(height: 10),
              // TextField(
              //   keyboardType: TextInputType.number,
              //   controller: secondController,
              //   decoration: InputDecoration(
              //     border: OutlineInputBorder(),
              //     labelText: "Enter Your Height in Feet",
              //     hintText: "0",
              //     prefixIcon: Icon(Icons.numbers_sharp),
              //   ),
              // ),
              // SizedBox(height: 40),
        
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: firstController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0), // Rounded corners
                      borderSide: BorderSide(color: Colors.orange, width: 2.0), // Border color and width
                    ),
                    labelText: "(Enter Your Weight in KG)",
                    labelStyle: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold), // Label style
                    hintText: "0",
                    hintStyle: TextStyle(color: Colors.grey), // Hint text style
                    prefixIcon: Icon(Icons.numbers_sharp, color: Colors.orange), // Icon color
                    filled: true,
                    fillColor: Colors.orange[50], // Background color
                    contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0), // Padding inside the TextField
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: secondController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0), // Rounded corners
                      borderSide: BorderSide(color: Colors.orange, width: 2.0), // Border color and width
                    ),
                    labelText: "(Enter Your Height in Feet)",
                    labelStyle: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold), // Label style
                    hintText: "0",
                    hintStyle: TextStyle(color: Colors.grey), // Hint text style
                    prefixIcon: Icon(Icons.numbers_sharp, color: Colors.orange), // Icon color
                    filled: true,
                    fillColor: Colors.orange[50], // Background color
                    contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0), // Padding inside the TextField
                  ),
                ),
              ),
        
              SizedBox(height: 40),
        
        
              ElevatedButton(
                onPressed: () {
                  String weightkg = firstController.text;
                  String heightFeet = secondController.text;
        
                  if (weightkg.isNotEmpty && heightFeet.isNotEmpty) {
                    sum(weightkg, heightFeet);
                  } else {
                    Get.snackbar(
                      "Please, Input Both Numbers",
                      "Try Again",
                      snackPosition: SnackPosition.BOTTOM,
                      duration: Duration(seconds: 2),
                      backgroundGradient: LinearGradient(
                        colors: [Color(0xFF2196F3), Color(0xFF00BCD4)],
                      ),
                      colorText: Color(0xFFFFA000),
                      borderRadius: 10,
                      margin: EdgeInsets.all(10),
                      icon: Icon(
                        Icons.warning,
                        color: Colors.red,
                        size: 40,
        
        
                      ),// Snack bar icon
                      isDismissible: true,
                      snackStyle: SnackStyle.FLOATING,
                    );
                  }
                },
                child: Text(
                  "Calculate",
                  style: GoogleFonts.aclonica(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color(0xFFFFA000),
                  shadowColor: Color(0xFFB8C5EE),
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 40),
              // Obx( // to show result this page
              //       () => Text(
              //     result.value,
              //     style: TextStyle(
              //       fontSize: 60,
              //       fontWeight: FontWeight.bold,
              //       color: Colors.orange,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
