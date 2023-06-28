import 'package:flutter/material.dart';

class NeumorContainer extends StatelessWidget {
  final Widget child;
  const NeumorContainer({super.key, required this.child,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: Container(
       alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(50),
          boxShadow: const [
            BoxShadow(
              color: Color(0xffbebebe),
              offset: Offset(10, 10),
              blurRadius: 30,
              spreadRadius: 1,
            ),
            BoxShadow(
              color: Colors.white,
              offset: Offset(-10, -10),
              blurRadius: 30,
              spreadRadius: 1,
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
