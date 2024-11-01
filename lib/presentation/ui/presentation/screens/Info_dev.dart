import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../providers/StateProvider.dart';
import '../widgets/LanguageSwitcher.dart';

void main() {
  runApp(ProviderScope(child: dashboardInfo()));
}



class dashboardInfo extends StatelessWidget {
  const dashboardInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IdiomaDev(),
    );
  }
}

class IdiomaDev extends ConsumerStatefulWidget {
  @override
  IdiomaDevState createState() => IdiomaDevState();
}

class IdiomaDevState extends ConsumerState<IdiomaDev> {
  @override
  Widget build(BuildContext context) {
    // Obtener el estado actual del idioma
    final currentLocale = ref.watch(languageProvider.notifier).state;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            LanguageSwitcher(), // Aquí se integra el LanguageSwitcher
          ],
        ),
      ),
    );
  }
}