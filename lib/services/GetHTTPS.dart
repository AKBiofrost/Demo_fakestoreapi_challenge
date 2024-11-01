import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/otros/DatabaseHelper.dart';
import '../models/product/product.dart';
import 'package:http/http.dart' as http;

import '../presentation/ui/presentation/widgets/dialog.dart';

class ApiService {
  String? baseUrl = dotenv.env['API_URL'] ?? 'No URL found';

  Future<List<Product>> fetchProducts() async {
    late String? _rememberMe = "";
    DateTime ahora = DateTime.now();
    final prefs = await SharedPreferences.getInstance();
    List<Product> products = [];

    _rememberMe = prefs.getString('now');
    DateTime dateTime = DateTime.parse(_rememberMe!);

    print("Product $dateTime");

    // Calcular la diferencia
    Duration diferencia = ahora.difference(dateTime);
    late var valor = diferencia.inMinutes;
    print("valor de diferencia****** $valor");


    if (valor > 5) {
      // la diferencia en tiempo es mayor a 5 min, por lo que es necesario refrescar valores de SQLite con el servidor
      final String baseUrlPeticion = "$baseUrl/products";
      final response = await http.get(Uri.parse(baseUrlPeticion));

      if (response.statusCode == 200) {
        DateTime horaGuardada = DateTime(
            ahora.year, ahora.month, ahora.day, ahora.hour, ahora.minute);
        prefs.setString("now", horaGuardada.toString());

        List<dynamic> body = json.decode(response.body);
        return body.map((dynamic item) => Product.fromJson(item)).toList();
      }
      else {
        builder:
            (BuildContext context) {
          mostrarBottomSheetFallido(context);
        };

        throw Exception('Failed to load products');
      }
    }
    else {
      List<Product> savedProducts = await DatabaseHelper().getProducts();
      print("Entro aqui por pasar suficiente tiempo");
      for (var product in savedProducts) {
        print(product.title); // Imprime el título de cada producto guardado
        print(product.image); // Imprime el título de cada producto guardado
        products.add(product);
      }

      return products;
    }
  }

    Future<void> fetchProductsLimit(String limit) async {
      final String baseUrlPeticion = "$baseUrl/limit";
      final response = await http.get(Uri.parse(baseUrlPeticion));

      if (response.statusCode == 200) {
        // dynamic body = json.decode(response.body);
        var product = jsonDecode(response.body);
        print('ID: ${product['id']}');
        print('Título: ${product['title']}');
        print('Precio: \$${product['price']}');
        print('Descripción: ${product['description']}');
        print('Categoría: ${product['category']}');
        print('Imagen: ${product['image']}');
        print(
            'Calificación: ${product['rating']['rate']} (Contador: ${product['rating']['count']})');
      } else {
        throw Exception('Failed to load products');
      }
    }
  }
