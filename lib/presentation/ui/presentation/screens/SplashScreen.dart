import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/Navigator.dart';
import 'dashboard.dart';

class SplashScreen extends StatefulWidget {
  final Widget? child;

  const SplashScreen({super.key, this.child});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late bool _rememberMe = false;
  late bool _SaltarOnBoardin = false;
  late bool _rememberMeC = false;

  @override
  initState() {
    _loadPreferences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color colorFromHex = const Color(0xA20000);

    return Scaffold(
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(
          'assets/logo.png',
          fit: BoxFit.contain,
          height: 300,
        ),
        SizedBox(
          height: 80,
        ),
        Text(
          'Alexander Krhonos Bivfröst',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, fontFamily: 'lora'),
        ),
        Text(
          dotenv.env['API_URL'] ?? 'No URL found',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Color.fromARGB(250, 160, 0, 0)),
        )
      ])),
    );
  }

  // Method to load the shared preference data
  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _rememberMe = prefs.getBool('login') ?? false;
      _SaltarOnBoardin = prefs.getBool('Saltar') ?? false;
/*-------------------------------------------------------------------------------*/

          Future.delayed(Duration(seconds: 3), () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Main_navigation()),
                ModalRoute.withName("/main"));
          });



    });
  }
}
