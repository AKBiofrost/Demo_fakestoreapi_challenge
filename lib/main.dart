import 'package:demo_fake_store/presentation/ui/presentation/screens/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

 main() async {

  await dotenv.load(fileName: ".env");
  runApp(ProviderScope(child: MyApp()));


}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: dotenv.env['API_URL'] ?? 'No URL found',
      routes: {
        '/': (context) => SplashScreen(
          // Here, you can decide whether to show the LoginPage or HomePage based on user authentication
          // child: SplashScreen(),
        ),
      },
    );
  }
}
