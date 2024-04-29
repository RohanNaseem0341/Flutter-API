import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_news_app/Home_Screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 7), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home_Screen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    final Height = MediaQuery.sizeOf(context).height * 1;
    final Width = MediaQuery.sizeOf(context).width * 1;

    return Scaffold(
      body: Container(
        child: Column(children: [
          SizedBox(
            height: Height * 0.2,
          ),
          Image.asset(
            'images/splash.jpg',
            fit: BoxFit.cover,
            width: Width * .9,
            height: Height * .5,
          ),
          SizedBox(
            height: Height * 0.05,
          ),
          Text(
            'TOP HEADLINE',
            style: GoogleFonts.anton(
                letterSpacing: .6, color: Colors.grey.shade700),
          ),
          SizedBox(
            height: Height * 0.08,
          ),
          SpinKitChasingDots(
            color: Color.fromARGB(255, 0, 0, 0),
            size: 40,
          )
        ]),
      ),
    );
  }
}
