import 'package:flutter/material.dart';

import '../widgets/disp_res.dart';
import 'homescreen.dart';

class QuizScreen extends StatefulWidget {
  final int random;

  const QuizScreen({super.key, required this.random});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late int rand;

  @override
  void initState() {
    super.initState();
    rand = widget.random;
  }

  final Map<String, bool> quiz1 = {
    "The capital of France is Paris": true,
    "The Great Barrier Reef is located in Australia": true,
    "Mount Everest is the tallest mountain in the world": true,
    "The Earth is flat": false,
    "The currency of Japan is the Yen": true,
    "Neil Armstrong was the first person to walk on the moon": true,
    "The Statue of Liberty was a gift from France to the USA": true,
    "The Nile is the longest river in the world": false,
    "The Mona Lisa was painted by Michelangelo": false,
    "The biggest ocean in the world is the Atlantic Ocean": false,
  };

  Map<String, bool> quiz2 = {
    "Is the earth flat?": false,
    "Is water wet?": true,
    "Is chocolate poisonous for dogs?": true,
    "Is the capital of France Madrid?": false,
    "Can birds fly backwards?": false,
    "Is the moon a planet?": false,
    "Is the Great Wall of China visible from space?": false,
    "Is the sky blue because of the reflection of the ocean?": false,
    "Can humans breathe underwater?": false,
    "Is the sun a planet?": false,
  };

  final Map<String, bool> quiz3 = {
    'The tallest mammal in the world is the giraffe.': true,
    'The human body has four lungs.': false,
    'The Great Barrier Reef is located in Australia.': true,
    'Sharks are mammals.': false,
    'The currency of Japan is the yen.': true,
    'The biggest planet in our solar system is Mars.': false,
    'An adult human has 32 teeth.': false,
    'The Statue of Liberty was gifted to the United States by France.': true,
    'The human heart has four chambers.': false,
    'The capital of Canada is Toronto.': false,
  };

  List marks = [];
  double index = 0;
  String t = 'true';
  String f = 'false';
  int check = 10;
  int score = 0;

  String display(rand) {
    if (rand == 1) {
      final questionNo = quiz1.keys.elementAt(index.toInt()).toString();
      return questionNo;
    } else if (rand == 2) {
      final questionNo = quiz2.keys.elementAt(index.toInt()).toString();
      return questionNo;
    } else if (rand == 3) {
      final questionNo = quiz3.keys.elementAt(index.toInt()).toString();
      return questionNo;
    }
    return '';
  }

  void chooseAnswer(ind, text, rand) {
    if (rand == 1) {
      final answer =
          quiz1.values.elementAt(ind.toInt()).toString().toLowerCase();
      if (ind >= quiz1.length - 1) {
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
        display(rand);
      });
    } else if (rand == 2) {
      final answer =
          quiz1.values.elementAt(ind.toInt()).toString().toLowerCase();
      if (ind >= quiz1.length - 1) {
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
        display(rand);
      });
    } else if (rand == 3) {
      final answer =
          quiz1.values.elementAt(ind.toInt()).toString().toLowerCase();
      if (ind >= quiz1.length - 1) {
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
        display(rand);
      });
    }
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
                      display(rand),
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
                          chooseAnswer(index, t, rand);
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
                          chooseAnswer(index, f, rand);
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
