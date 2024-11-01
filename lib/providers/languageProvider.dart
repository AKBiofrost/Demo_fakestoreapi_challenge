import 'package:flutter_riverpod/flutter_riverpod.dart';

class LanguageNotifier extends StateNotifier<String> {
  LanguageNotifier() : super('es'); // Idioma por defecto

  void changeLanguage(String newLanguage) {
    state = newLanguage;
  }
}

// Crea el provider
final languageProvider = StateNotifierProvider<LanguageNotifier, String>((ref) {
  return LanguageNotifier();
});