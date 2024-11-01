
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../screens/dashboard.dart';




void main_navegation() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const Main_navigation());
}

class Main_navigation extends StatefulWidget {
  const Main_navigation({super.key});

  @override
  State<Main_navigation> createState() => _MainAppState();
}

class _MainAppState extends State<Main_navigation> {
  int selectedIndex = 0;
  final destinationViews = [
    // const HomePage(),
    const dashboard(),
   // const Restaurantecercano(),
    //const SettingsPageHomePage(),
    //const PerfilUsuario(),

  ];

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final themeData = Provider.of<ThemeNotifier>(context, listen: true);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: destinationViews[selectedIndex],
        bottomNavigationBar: NavigationBar(
          selectedIndex: selectedIndex,
          onDestinationSelected: (int index) {
            setState(() {
              selectedIndex = index;
            });
          },
          indicatorColor: Colors.white,
          destinations: [
            NavigationDestination(
              tooltip: "Home",
              selectedIcon: Icon(
                IconlyBold.home,
                color: Color(0xFFA20000),
              ),
              icon: Icon(
                IconlyLight.home,
                color: Color(0xFFA20000),
              ),
              label: "Inicio",
            ),
            NavigationDestination(
              selectedIcon: Icon(
                IconlyBold.graph,
                color: Color(0xFFA20000),
              ),
              icon: Icon(
                IconlyLight.location,
                color: Color(0xFFA20000),
              ),
              label: "Info",
            ),

          ],
        ),
      ),
    );
  }
}