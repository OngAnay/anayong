import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista temporal de banners de publicidad para tus aliados
    final List<Widget> imageSliders = [
      _buildBanner("Publicidad La Dark Kitchen XL", Colors.orange),
      _buildBanner("Aliado 2: Servicios Mascotas", Colors.blue),
      _buildBanner("Aliado 3: Tienda Fit", Colors.green),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("ONG Añay"),
        backgroundColor: Colors.purple,
        actions: [
          IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // 1. Grilla de Iconos (Estilo Yape)
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 4,
              children: [
                _buildMenuIcon(Icons.pets, "Albergues"),
                _buildMenuIcon(Icons.shopping_bag, "Tienda"),
                _buildMenuIcon(Icons.handshake, "Aliados"),
                _buildMenuIcon(Icons.favorite, "Donar"),
                _buildMenuIcon(Icons.restaurant, "XL Kitchen"),
                _buildMenuIcon(Icons.directions_run, "Sección Fit"),
                _buildMenuIcon(Icons.grid_view, "Ver todo"),
              ],
            ),

            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Divider(),
            ),

            // 2. Título de Promociones
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Promociones de Aliados",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // 3. El Carrusel de Publicidad
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
              ),
              items: imageSliders,
            ),
            
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // Widget para crear los iconos del menú
  Widget _buildMenuIcon(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.purple.withValues(alpha: 0.1),
          child: Icon(icon, color: Colors.purple),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  // Widget para crear los banners temporales
  Widget _buildBanner(String text, Color color) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}