import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../models/otros/DatabaseHelper.dart';
import '../../../../models/product/product.dart';
import '../../../controler/idiomaControler.dart';
import 'Navigator.dart';

void mostrarBottomSheet(BuildContext context, String nombre, String precio, String imagen, String etiqueta) {

  if (nombre.isNotEmpty && precio.isNotEmpty && imagen.isNotEmpty) {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
          child: Container(
            height: 400,
            color: Colors.white,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 120,
                    height: 150,
                    child: Image.network(
                      imagen,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(Icons.error); // Mostrar un ícono de error si la imagen no se carga
                      },
                    ),
                  ),
                  Text(
                    precio,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    nombre,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 5),
                  ElevatedButton(
                    onPressed: () async {

                      // Recuperar los productos
                      List<Product> savedProducts = await DatabaseHelper().getProducts();

                      for (var product in savedProducts) {
                        print(product.title); // Imprime el título de cada producto guardado
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFA20000),
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      foregroundColor: Colors.white,
                    ),
                    child: Text(etiqueta),
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
          ),
        );
      },
    );
  } else {
    // Manejo de errores si alguno de los parámetros es nulo o vacío
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Por favor proporciona un nombre, precio e imagen válidos.'),
    ));
  }
}
void mostrarBottomSheetFallido(
    BuildContext context) {
  showModalBottomSheet(
    context: context,
    isDismissible: false,
    // Establecer en false para evitar que se oculte al tocar fuera
    isScrollControlled: true,
    // Agregar esta línea para evitar errores de layout
    backgroundColor: Colors.transparent,
    // Establecer el fondo transparente
    builder: (BuildContext context) {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
        // Bordes redondeados en la parte superior
        child: Container(
          height: 400, // Altura del BottomSheet
          color: Colors.white,
          child: Center(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Fallo inesperado",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Intente nuevamente.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 5),
                  ElevatedButton(
                    onPressed: () async {

                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Main_navigation()),
                            (Route<dynamic> route) => false,
                      );


                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFA20000),
                      padding: EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 15,
                      ),
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      foregroundColor:
                      Colors.white, // Establece el color del texto aquí
                    ),
                    child: Text('Comprar'),
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
