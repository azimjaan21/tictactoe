import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'intro_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 5)).then((value) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) => const IntroScreen(),
        ),
      );
    });
  }
  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: const Color.fromARGB(255, 0, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            Image.asset('assets/icon/logo.png'),
            
            
             Padding(
               padding: const EdgeInsets.symmetric(vertical: 20),
               child: SpinKitThreeBounce(
                size: 40,
               itemBuilder: (BuildContext context, int index) {
                 return  DecoratedBox(
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(20),
                     color: Colors.white,
                   ),
                   
                 );
               },
             ),
             ),
          ],
        ),
      ),
    );
  }
}
