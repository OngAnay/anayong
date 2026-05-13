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
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.purple),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.purple),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/carrito'),
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        currentIndex: 0, 
        onTap: (index) {
          if (index == 1) Navigator.pushNamed(context, '/ruta_impacto');
          if (index == 2) Navigator.pushNamed(context, '/perfil');
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: 'Tienda'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Ruta'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
      body: Column(
        children: [
          // Banner de transparencia de ganancias
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            color: Colors.orange.withValues(alpha: 0.1),
            child: const Text(
              "✨ El 100% de la ganancia neta va al albergue indicado.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 12),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(15),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.62, // Ajustado para que no se corte el texto
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                List<Map<String, String>> productos = [
                  {"nombre": "Polo Añay Oficial", "precio": "S/ 35.00", "albergue": "Albergue Chiguata"},
                  {"nombre": "Taza Dog Lover", "precio": "S/ 20.00", "albergue": "Patitas del Sur"},
                  {"nombre": "Gorra XL Pro", "precio": "S/ 25.00", "albergue": "Refugio San Fran"},
                  {"nombre": "Pañoleta Reflector", "precio": "S/ 15.00", "albergue": "Albergue Chiguata"},
                ];

                return _buildProductCard(
                  context,
                  productos[index]["nombre"]!,
                  productos[index]["precio"]!,
                  "https://images.unsplash.com/photo-1583511655857-d19b40a7a54e?auto=format&fit=crop&q=80&w=400",
                  productos[index]["albergue"]!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(BuildContext context, String nombre, String precio, String urlImagen, String albergue) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, 5))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagen con etiqueta de Albergue
          Expanded(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                    image: DecorationImage(image: NetworkImage(urlImagen), fit: BoxFit.cover),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.purple.withValues(alpha: 0.9),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text("PRO-FONDOS", style: TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(nombre, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14), maxLines: 1, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 4),
                // Aquí unificamos la tienda con el albergue visualmente
                Row(
                  children: [
                    const Icon(Icons.pets, size: 12, color: Colors.grey),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        albergue,
                        style: const TextStyle(color: Colors.grey, fontSize: 11, fontWeight: FontWeight.w500),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(precio, style: const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold, fontSize: 16)),
                    GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Añadido pro-fondos para $albergue")),
                        );
                      },
                      child: const Icon(Icons.add_shopping_cart, color: Colors.orange, size: 24),
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