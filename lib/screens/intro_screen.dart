import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tictactoe/screens/game_screen.dart';

import '../widgets/neu_container.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController player1Controller = TextEditingController();
  final TextEditingController player2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey[300],
          body: Form(
             autovalidateMode: AutovalidateMode.onUserInteraction,
              key: formKey,
            child: Center(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Tic Tac Toe',
                      style: TextStyle(
                          fontSize: 60,
                          fontFamily: 'DancingScript',
                          fontWeight: FontWeight.bold),
                    ),
                    NeumorContainer(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                          left: 0,
                          right: 0,
                          bottom: 20,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/svg/x.svg',
                                  height: 130,
                                ),
                                SvgPicture.asset(
                                  'assets/svg/o.svg',
                                  height: 130,
                                ),
                              ],
                            ),
                            const Text(
                              'Enter Players Name',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 25, horizontal: 20),
                              child: TextFormField(
                                controller: player1Controller,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide:
                                        const BorderSide(color: Colors.black),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                        color: Color.fromARGB(255, 232, 15, 0)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide:
                                        const BorderSide(color: Colors.black),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                        color: Color.fromARGB(255, 242, 16, 0)),
                                  ),
                                  hintText: 'Player 1 Name',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please, enter Player 1 Name';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              child: TextFormField(
                                controller: player2Controller,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide:
                                        const BorderSide(color: Colors.black),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                        color: Color.fromARGB(255, 232, 15, 0)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide:
                                        const BorderSide(color: Colors.black),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                        color: Color.fromARGB(255, 242, 16, 0)),
                                  ),
                                  hintText: 'Player 2 Name',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please, enter Player 2 Name';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GameScreen(
                                player1: player1Controller.text,
                                player2: player2Controller.text,
                              ),
                            ),
                          );
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: const LinearGradient(
                            colors: [
                              Color.fromARGB(217, 255, 55, 0),
                              Color.fromARGB(255, 255, 34, 0)
                            ],
                          ),
                        ),
                        child: const Text(
                          'Start',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),),
    );
  }
}
