import 'dart:convert';

import '../models/product/product.dart';
import 'package:http/http.dart' as http;




class ApiService {
  final String baseUrl = 'https://fakestoreapi.com/products';

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      return body.map((dynamic item) => Product.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<void> fetchProductsLimit(String limit) async {
    final response = await http.get(Uri.parse(baseUrl+"/"+limit));

    if (response.statusCode == 200) {
     // dynamic body = json.decode(response.body);
      var product = jsonDecode(response.body);
      print('ID: ${product['id']}');
      print('Título: ${product['title']}');
      print('Precio: \$${product['price']}');
      print('Descripción: ${product['description']}');
      print('Categoría: ${product['category']}');
      print('Imagen: ${product['image']}');
      print('Calificación: ${product['rating']['rate']} (Contador: ${product['rating']['count']})');

    } else {
      throw Exception('Failed to load products');
    }
  }
}