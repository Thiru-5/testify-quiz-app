import 'dart:math';

import 'package:flutter/material.dart';
import 'package:testify/screens/questions.dart';
import 'package:testify/screens/quizscreen.dart';
import 'package:quickalert/quickalert.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int rand = 1;
  bool proceed = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 223, 255, 225),
      appBar: AppBar(
        title: const Text(
          'Testify',
          style: TextStyle(
            fontSize: 45,
            fontWeight: FontWeight.bold,
            fontFamily: 'Testify',
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        // backgroundColor: const Color.fromARGB(255, 255, 236, 192),
      ),
      body: Stack(
        children: [
          Padding(
            // padding: const EdgeInsets.only(left: 150, top: 40),
            padding: const EdgeInsets.only(left: 150, top: 40),
            child: Image.asset(
              'assets/student.png',
              alignment: Alignment.centerLeft,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: size.height * 0.08),
                TextButton(
                  onPressed: () {
                    QuickAlert.show(
                      context: context,
                      type: QuickAlertType.info,
                      text:
                          '\nAre you ready to create 10 true/false questions in the next section?',
                      confirmBtnText: 'Yes',
                      title: 'Disclaimer',
                    ).then(
                      (_) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Questions(),
                          ),
                        );
                      },
                    );
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(107, 43, 0, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      padding: const EdgeInsets.all(20)),
                  child: const Text(
                    'Create the Quiz',
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Testify',
                      color: Color.fromARGB(255, 255, 236, 192),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.025),
                TextButton(
                  onPressed: () {
                    QuickAlert.show(
                      context: context,
                      type: QuickAlertType.confirm,
                      text: 'Do you want to take the quiz?',
                      confirmBtnText: 'Yes',
                      cancelBtnText: 'No',
                      showCancelBtn: true,
                      onCancelBtnTap: () {
                        setState(() {
                          proceed = false;
                        });
                        Navigator.of(context).pop(); // Close the alert dialog
                      },
                      confirmBtnColor: Colors.green,
                    ).then((value) {
                      setState(() {
                        rand = Random().nextInt(3) + 1;
                      });
                      if (proceed) {
                        // Check the value of the boolean variable
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuizScreen(random: rand),
                          ),
                        );
                      }
                    });
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(107, 43, 0, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    padding: const EdgeInsets.all(20),
                  ),
                  child: const Text(
                    'Take the Quiz',
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Testify',
                      color: Color.fromARGB(255, 255, 236, 192),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
