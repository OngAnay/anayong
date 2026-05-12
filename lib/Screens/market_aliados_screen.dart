import 'package:flutter/material.dart';

class MarketAliadosScreen extends StatelessWidget {
  const MarketAliadosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FBFD),
      appBar: AppBar(
        title: const Text(
          "Market Aliados",
          style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF03A9F4)),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF03A9F4)),
      ),
      body: Column(
        children: [
          // FILTROS DE CATEGORÍAS
          Container(
            height: 100,
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                _buildCategoryItem(Icons.fitness_center, "Gimnasios"),
                _buildCategoryItem(Icons.local_hospital, "Clínicas"),
                _buildCategoryItem(Icons.restaurant, "Restaurantes"),
                _buildCategoryItem(Icons.home, "Inmobiliarias"),
                _buildCategoryItem(Icons.build, "Talleres"),
              ],
            ),
          ),

          // LISTA DE ALIADOS
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                _buildAliadoCard("Gym Power", "Gimnasio", "Descuento 20%", Icons.fitness_center),
                _buildAliadoCard("Clínica Dental San José", "Salud", "Limpieza 2x1", Icons.local_hospital),
                _buildAliadoCard("La Pizzería XL", "Restaurante", "Postre gratis", Icons.restaurant),
                const SizedBox(height: 20), // Espacio final para que no pegue al borde
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(IconData icono, String label) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: const Color(0xFF03A9F4),
            child: Icon(icono, color: Colors.white, size: 20),
          ),
          const SizedBox(height: 5),
          Text(
            label, 
            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildAliadoCard(String nombre, String rubro, String beneficio, IconData icono) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05), 
            blurRadius: 10,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFE1F5FE), 
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(icono, color: const Color(0xFF03A9F4)),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nombre, 
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  rubro, 
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green.shade50, 
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    beneficio, 
                    style: const TextStyle(
                      color: Colors.green, 
                      fontSize: 11, 
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
        ],
      ),
    );
  }
}