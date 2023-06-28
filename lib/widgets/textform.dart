import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  const TextFormWidget({
    super.key,
    required this.player1Controller,
    required this.player2Controller,
  });

  final TextEditingController player1Controller;
  final TextEditingController player2Controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
          child: TextFormField(
            controller: player1Controller,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.black),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide:
                    const BorderSide(color: Color.fromARGB(255, 232, 15, 0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.black),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide:
                    const BorderSide(color: Color.fromARGB(255, 242, 16, 0)),
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
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: TextFormField(
            controller: player2Controller,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.black),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide:
                    const BorderSide(color: Color.fromARGB(255, 232, 15, 0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.black),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide:
                    const BorderSide(color: Color.fromARGB(255, 242, 16, 0)),
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
    );
  }
}
