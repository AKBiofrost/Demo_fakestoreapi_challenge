


String getLocalizedString(String key, String language) {
  const Map<String, Map<String, String>> localizedStrings = {
    'es': {
      'Nombre': 'Tienda de productos falsas',
      'Comprar': 'Comprar',
    },
    'en': {
      'Nombre': 'Fake Store Products',
      'Comprar': 'buy',
    },
  };

  return localizedStrings[language]?[key] ?? key;
}