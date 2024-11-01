import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../models/otros/DatabaseHelper.dart';
import '../../../../models/product/product.dart';
import 'Navigator.dart';

void mostrarBottomSheet(
    BuildContext context, String nombre, String precio, String imagen) {
  if (nombre != null && precio != null && imagen != null) {
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
                    Container(
                      width: 120, // Ajusta el ancho deseado
                      height: 150, // Ajusta la altura deseada
                      child: Image.network(
                        imagen,
                        fit: BoxFit
                            .cover, // Ajusta el modo de ajuste de la imagen
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
                        /*
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Dashboardcliente()),
                            (Route<dynamic> route) => false,
                      );
                      */
                        // Para recuperar los productos:
                        List<Product> savedProducts = await DatabaseHelper()
                            .getProducts();

                        for (var product in savedProducts) {
                          print(product
                              .title); // Imprime el título de cada producto guardado.


                        }
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
