import 'package:demo_fake_store/services/GetHTTPS.dart';
import 'package:flutter/material.dart';

import '../../../../models/product/product.dart';



class dashboard extends StatelessWidget {
  const dashboard({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductList(),
    );
  }
}

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  late Future<List<Product>> futureProducts;
  late Future<Product> futureProductsLimit;
  @override
  void initState()  {
    super.initState();
    futureProducts = ApiService().fetchProducts();
    ApiService().fetchProductsLimit("10");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fake Store Products'),
      ),
      body: FutureBuilder<List<Product>>(
        future: futureProducts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No products found'));
          }

          List<Product> products = snapshot.data!;
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Image.network(products[index].image),
                title: Text(products[index].title),
                subtitle: Text('\$${products[index].price}'),
              );
            },
          );
        },
      ),
    );
  }
}
