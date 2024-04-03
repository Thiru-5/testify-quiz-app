import 'package:flutter/material.dart';
import 'package:testify/screens/homescreen.dart';
import 'package:testify/widgets/disp_res.dart';

class QuestionQuiz extends StatefulWidget {
  final Map<String, bool> questions;
  const QuestionQuiz({super.key, required this.questions});

  @override
  State<QuestionQuiz> createState() => _QuestionQuizState();
}

class _QuestionQuizState extends State<QuestionQuiz> {
  late Map<String, bool> _ques;
  List marks = [];
  double index = 0;
  String t = 'true';
  String f = 'false';
  int check = 10;
  int score = 0;

  @override
  void initState() {
    super.initState();
    _ques = widget.questions;
  }

  String display() {
    final questionNo = _ques.keys.elementAt(index.toInt()).toString();
    return questionNo;
  }

  void chooseAnswer(ind, text) {
    final answer = _ques.values.elementAt(ind.toInt()).toString().toLowerCase();
    if (ind >= _ques.length - 1) {
      if (answer == text) {
        marks.add('True');
        score += 1;
      } else {
        marks.add('False');
      }
    } else {
      if (answer == text) {
        marks.add('True');
        score += 1;
      } else {
        marks.add('False');
      }
      index += 1;
    }
    setState(() {
      display();
    });
  }

  @override
  Widget build(BuildContext context) {
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
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
      ),
      body: check > 0
          ? Column(
              children: [
                const SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.1,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.black,
                        Colors.brown,
                      ],
                    ),
                    // borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 5.0,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      display(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.black,
                            Colors.brown,
                          ],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 5.0,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: TextButton(
                        onPressed: () {
                          chooseAnswer(index, t);
                          check -= 1;
                        },
                        child: const Text(
                          'True',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.black,
                            Colors.brown,
                          ],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 5.0,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: TextButton(
                        onPressed: () {
                          chooseAnswer(index, f);
                          check -= 1;
                        },
                        child: const Text(
                          'False',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                DisplayResult(
                  marks: marks,
                ),
              ],
            )
          : Center(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'Your Answers:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 20),
                  DisplayResult(
                    marks: marks,
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(height: 10),
                  const Text(
                    'Your Score',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'You scored: $score points',
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 40),
                  FloatingActionButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    },
                    backgroundColor: const Color.fromARGB(255, 255, 236, 192),
                    foregroundColor: Colors.black,
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    heroTag: 'Marks',
                    clipBehavior: Clip.none,
                    splashColor: Colors.brown,
                    child: const Icon(Icons.home),
                  ),
                ],
              ),
            ),
    );
  }
}
