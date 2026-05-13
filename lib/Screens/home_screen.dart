import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de banners de publicidad para tus aliados
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
          IconButton(
            icon: const Icon(Icons.shopping_cart), 
            onPressed: () => Navigator.pushNamed(context, '/carrito')
          ),
          IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
        ],
      ),
      // --- AQUÍ ESTÁ EL DRAWER (MENÚ LATERAL) QUE SOLICITASTE ---
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.purple),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Menú Añay",
                    style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "El Refugio Perfecto",
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.purple),
              title: const Text("Inicio"),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.pets, color: Colors.purple),
              title: const Text("Adopciones"),
              onTap: () => Navigator.pushNamed(context, '/adopciones'),
            ),
            ListTile(
              leading: const Icon(Icons.volunteer_activism, color: Colors.purple),
              title: const Text("Logística de Donaciones"),
              onTap: () => Navigator.pushNamed(context, '/logistica'),
            ),
            ListTile(
              leading: const Icon(Icons.history, color: Colors.purple),
              title: const Text("Nuestra Historia"),
              onTap: () => Navigator.pushNamed(context, '/historia'),
            ),
            ListTile(
              leading: const Icon(Icons.group, color: Colors.purple),
              title: const Text("Comunidades"),
              onTap: () => Navigator.pushNamed(context, '/comunidades'),
            ),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.purple),
              title: const Text("Mi Perfil"),
              onTap: () => Navigator.pushNamed(context, '/perfil'),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.exit_to_app, color: Colors.red),
              title: const Text("Cerrar Sesión"),
              onTap: () => Navigator.pushReplacementNamed(context, '/'),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // 1. Grilla de Iconos (Estilo Yape) - ¡AHORA TIENEN FUNCIÓN!
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 4,
              children: [
                _buildMenuIcon(context, Icons.pets, "Albergues", '/adopciones'),
                _buildMenuIcon(context, Icons.shopping_bag, "Tienda", '/catalogo'),
                _buildMenuIcon(context, Icons.handshake, "Aliados", '/market_aliados'),
                _buildMenuIcon(context, Icons.favorite, "Donar", '/logistica'),
                _buildMenuIcon(context, Icons.restaurant, "XL Kitchen", '/detalle_aliado'),
                _buildMenuIcon(context, Icons.directions_run, "Sección Fit", '/ruta_impacto'),
                _buildMenuIcon(context, Icons.videocam, "Feet Videos", '/feet_videos'),
                _buildMenuIcon(context, Icons.grid_view, "Ver todo", '/comunidades'),
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

            // 3. El Carrusel de Publicidad (Se mantiene igual)
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

  // Widget para crear los iconos del menú con navegación integrada
  Widget _buildMenuIcon(BuildContext context, IconData icon, String label, String route) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.purple.withValues(alpha: 0.1),
            child: Icon(icon, color: Colors.purple),
          ),
          const SizedBox(height: 4),
          Text(
            label, 
            style: const TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // Widget para crear los banners
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