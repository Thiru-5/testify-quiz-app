import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:testify/screens/question_quiz.dart';

import '../widgets/fancycontainer.dart';
import '../widgets/listcontent.dart';

class Questions extends StatefulWidget {
  const Questions({super.key});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  final _formKey = GlobalKey<FormState>();
  final _questionController = TextEditingController();
  final _optionController = TextEditingController();
  final _questions = <String, bool>{};
  double limit = 10;
  double number = 1;

  @override
  void dispose() {
    _questionController.dispose();
    _optionController.dispose();
    super.dispose();
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            FancyContainer(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.85,
              title: 'Enter Questions',
              subtitle: '${limit.toInt()} left!',
              color1: Colors.black,
              color2: Colors.brown,
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 236, 192),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: limit > 0
                        ? Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                const SizedBox(height: 20),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    controller: _questionController,
                                    cursorColor: Colors.black,
                                    cursorHeight: 20,
                                    decoration: InputDecoration(
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                      ),
                                      focusedBorder: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(40),
                                        gapPadding: 5,
                                      ),
                                      labelText: 'Question',
                                      labelStyle: const TextStyle(
                                        color: Colors.black,
                                      ),
                                      contentPadding: const EdgeInsets.all(20),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter a question';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    controller: _optionController,
                                    cursorColor: Colors.black,
                                    cursorHeight: 20,
                                    decoration: InputDecoration(
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                      ),
                                      focusedBorder: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(40),
                                        gapPadding: 5,
                                      ),
                                      labelText: 'Option (True/False)',
                                      labelStyle: const TextStyle(
                                        color: Colors.black,
                                      ),
                                      contentPadding: const EdgeInsets.all(20),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter an option';
                                      } else if (!['true', 'false']
                                          .contains(value.toLowerCase())) {
                                        return 'Please enter a valid option (True/False)';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                  ),
                                  onPressed: () {
                                    if (_optionController.text.toLowerCase() ==
                                        'true') {
                                      _questions[_questionController.text] =
                                          true;
                                      limit--;
                                      number++;
                                    } else if (_optionController.text
                                            .toLowerCase() ==
                                        'false') {
                                      _questions[_questionController.text] =
                                          false;
                                      limit--;
                                      number++;
                                    } else {
                                      if (_questionController.text.isEmpty) {
                                        Future.delayed(
                                          const Duration(milliseconds: 300),
                                          () {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                  'Please enter a question!',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                duration: Duration(seconds: 3),
                                                backgroundColor: Color.fromARGB(
                                                    255, 37, 26, 22),
                                              ),
                                            );
                                          },
                                        );
                                      } else if (_optionController.text
                                                  .toLowerCase() !=
                                              'true' &&
                                          _optionController.text
                                                  .toLowerCase() !=
                                              'false') {
                                        Future.delayed(
                                            const Duration(milliseconds: 300),
                                            () {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                'Please enter correct options!',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              duration: Duration(seconds: 3),
                                              backgroundColor: Color.fromARGB(
                                                  255, 37, 26, 22),
                                            ),
                                          );
                                        });
                                      }
                                    }
                                    FocusScope.of(context).unfocus();
                                    _optionController.clear();
                                    _questionController.clear();

                                    setState(() {}); // rebuild the widget tree
                                  },
                                  child: const Text('Next'),
                                ),
                              ],
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  width:
                                      MediaQuery.of(context).size.width * 0.85,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 255, 236, 192),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: DefaultTextStyle(
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 60.0,
                                      fontFamily: 'OldNewspaperTypes',
                                    ),
                                    child: AnimatedTextKit(
                                      repeatForever: true,
                                      displayFullTextOnTap: true,
                                      animatedTexts: [
                                        TypewriterAnimatedText(
                                          'Awesome Work,',
                                          textAlign: TextAlign.center,
                                          speed: const Duration(
                                            milliseconds: 75,
                                          ),
                                        ),
                                        TypewriterAnimatedText(
                                          'Please head to the',
                                          textAlign: TextAlign.center,
                                          speed: const Duration(
                                            milliseconds: 75,
                                          ),
                                        ),
                                        TypewriterAnimatedText(
                                          'Quiz Section',
                                          textAlign: TextAlign.center,
                                          speed: const Duration(
                                            milliseconds: 75,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ContentDisplay(questions: _questions),
            const SizedBox(height: 20),
            limit <= 0
                ? Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => QuestionQuiz(
                                questions: _questions,
                              ),
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 255, 236, 192),
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
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  )
                : const SizedBox(height: 1),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
