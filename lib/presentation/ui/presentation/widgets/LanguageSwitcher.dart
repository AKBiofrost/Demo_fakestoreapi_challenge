import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../providers/languageProvider.dart';



class LanguageSwitcher extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            ref.read(languageProvider.notifier).state = 'es'; // Cambiar a español
          },
          child: Text('Español'),
        ),
        SizedBox(width: 20),
        ElevatedButton(
          onPressed: () {
            ref.read(languageProvider.notifier).state ='en'; // Cambiar a inglés
          },
          child: Text('English'),
        ),
      ],
    );
  }
}


