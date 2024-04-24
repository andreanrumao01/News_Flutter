import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Image.asset(
              "images/building.jpg",
              width: MediaQuery.of(context).size.width,
              height: 400,
              fit: BoxFit.cover,
            )
          ],
        ),
      ),
    );
  }
}
