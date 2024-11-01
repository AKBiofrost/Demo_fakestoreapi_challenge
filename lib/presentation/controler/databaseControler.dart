import '../../models/otros/DatabaseHelper.dart';
import '../../models/product/product.dart';

void saveProducts(List<Product> products) async {
  final dbHelper = DatabaseHelper();

  for (var product in products) {
    await dbHelper.insertProduct(product);
  }
}