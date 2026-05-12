import 'package:flutter/material.dart';

class CatalogoMerchScreen extends StatelessWidget {
  const CatalogoMerchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text(
          "Tienda Solidaria Añay",
          style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF01579B)),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF01579B)),
        actions: [
          IconButton(
            onPressed: () {
              // Lógica para abrir el carrito
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(15),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,           // Dos columnas
          childAspectRatio: 0.65,      // Ajustado para que quepa bien el texto abajo
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        itemCount: 4, // Por ahora mostramos 4 productos
        itemBuilder: (context, index) {
          // Datos de ejemplo para visualizarlo mejor
          List<Map<String, String>> productos = [
            {"nombre": "Polo Añay", "precio": "S/ 35.00", "albergue": "Albergue Patitas"},
            {"nombre": "Taza Dog Lover", "precio": "S/ 20.00", "albergue": "Huellitas de Amor"},
            {"nombre": "Gorra XL", "precio": "S/ 25.00", "albergue": "ONG Añay"},
            {"nombre": "Pañoleta Reflector", "precio": "S/ 15.00", "albergue": "Albergue Chiguata"},
          ];

          return _buildProductCard(
            productos[index]["nombre"]!,
            productos[index]["precio"]!,
            "https://via.placeholder.com/150", // Placeholder hasta que tengan las fotos reales
            productos[index]["albergue"]!,
          );
        },
      ),
    );
  }

  Widget _buildProductCard(String nombre, String precio, String urlImagen, String albergue) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagen del producto
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                image: DecorationImage(
                  image: NetworkImage(urlImagen),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Información del producto
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nombre,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  "De: $albergue",
                  style: const TextStyle(color: Colors.grey, fontSize: 11),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      precio,
                      style: const TextStyle(
                        color: Color(0xFF03A9F4),
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const Icon(
                      Icons.add_circle,
                      color: Color(0xFF01579B),
                      size: 28,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}