import 'package:demo_fake_store/services/GetHTTPS.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../presentation/ui/presentation/widgets/dialog.dart';
import '../../../../models/product/product.dart';
import '../../../../providers/languageProvider.dart';
import '../../../controler/databaseControler.dart';
import '../../../controler/idiomaControler.dart';

void main() {
  runApp(ProviderScope(child: dashboard()));
}

class dashboard extends StatelessWidget {
  const dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductList(),
    );
  }
}

class ProductList extends ConsumerStatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends ConsumerState<ProductList> {
  late Future<List<Product>> futureProducts;

  @override
  void initState() {
    super.initState();
    futureProducts = ApiService().fetchProducts();

  }

  @override
  Widget build(BuildContext context) {
   // final languageProvider = StateProvider<String>((ref) => 'es'); // Default to 'es'
    final language = ref.watch(languageProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text( getLocalizedString('Nombre', language) ),
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
          saveProducts(products); // guardamos la lista que se presente!!!!!
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  // Aquí puedes manejar la acción al hacer clic
                  print('Producto clickeado: ${products[index].title}');

                  mostrarBottomSheet(context, products[index].title,
                      products[index].price.toString(), products[index].image, getLocalizedString('Comprar', language));
                  // También puedes navegar a otra pantalla o mostrar un diálogo
                },
                leading: Container(
                  width: 50, // Ajusta el ancho deseado
                  height: 80, // Ajusta la altura deseada
                  child: Image.network(
                    products[index].image,
                    fit: BoxFit.cover, // Ajusta el modo de ajuste de la imagen
                  ),
                ),
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
