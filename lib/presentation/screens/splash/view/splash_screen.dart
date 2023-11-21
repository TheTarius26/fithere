import 'package:fithere/config/constants/dimen.dart';
import 'package:fithere/core/routes/route.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(context, Routes.home),
    );
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.transparent,
              child: FlutterLogo(
                size: 100,
              ),
            ),
            SizedBox(height: kPadding * 2),
            Text(
              'FitHere',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Find fun activities near you',
              style: TextStyle(
                fontSize: 12,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
