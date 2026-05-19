import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'albergue_model.dart'; // Importamos el modelo para usar la lista dinámica
import 'perfil_albergue_screen.dart'; // Importamos la pantalla de destino

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // --- LISTA DE ALBERGUES DE AREQUIPA INVENTADOS Y REALES ---
    final List<Albergue> listaAlbergues = [
      Albergue(
        id: '1', // <--- Se agregó el id requerido por el modelo
        nombre: 'Albergue Patitas Chiguata (Añay)',
        ubicacion: 'Distrito de Chiguata, Arequipa',
        resena: 'Sede central impulsada por la ONG Añay. Nos dedicamos al rescate y rehabilitación en las faldas del Misti, garantizando una vida digna y un refugio perfecto.',
        imagenUrl: 'https://images.unsplash.com/photo-1548199973-03cce0bbc87b?auto=format&fit=crop&q=80',
        cantidadPerros: 45,
        metaDonacion: 2000.0,
        recaudado: 1200.0,
      ),
      Albergue(
        id: '2', // <--- Se agregó el id requerido por el modelo
        nombre: 'Refugio Canino Cono Norte',
        ubicacion: 'Cono Norte, Arequipa',
        resena: 'Espacio dedicado a rescatar perritos callejeros de las zonas industriales del norte de la ciudad. Enfocados en alimentación masiva y campañas de esterilización.',
        imagenUrl: 'https://images.unsplash.com/photo-1583511655857-d19b40a7a54e?auto=format&fit=crop&q=80',
        cantidadPerros: 60,
        metaDonacion: 3500.0,
        recaudado: 1800.0,
      ),
      Albergue(
        id: '3', // <--- Se agregó el id requerido por el modelo
        nombre: 'Hogar Peluditos La 54',
        ubicacion: 'Sector La 54, Cerro Colorado, Arequipa',
        resena: 'Un hogar temporal gestionado por voluntarios de la comunidad para rescatar animales abandonados en mercados y avenidas principales.',
        imagenUrl: 'https://images.unsplash.com/photo-1534361960057-19889db9621e?auto=format&fit=crop&q=80',
        cantidadPerros: 30,
        metaDonacion: 1500.0,
        recaudado: 900.0,
      ),
      Albergue(
        id: '4', // <--- Se agregó el id requerido por el modelo
        nombre: 'Albergue Valle Verde Yumina',
        ubicacion: 'Sabandía - Yumina, Arequipa',
        resena: 'Refugio verde y campestre en la campiña arequipeña enfocado en la recuperación psicológica de perritos que sufrieron de maltrato extremo.',
        imagenUrl: 'https://images.unsplash.com/photo-1601758228041-f3b2795255f1?auto=format&fit=crop&q=80',
        cantidadPerros: 25,
        metaDonacion: 2500.0,
        recaudado: 2100.0,
      ),
    ];

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
      // --- DRAWER (MENÚ LATERAL) ---
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

            // --- SECCIÓN: VIDEO HISTORIA Y META ---
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(color: Colors.black.withValues(alpha:.1), blurRadius: 10)],
              ),
              child: Column(
                children: [
                  const Text("Nuestra Historia", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.purple)),
                  const SizedBox(height: 10),
                  Container(
                    height: 180,
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.black12, borderRadius: BorderRadius.circular(15)),
                    child: const Icon(Icons.play_circle_fill, size: 60, color: Colors.purple),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Meta 2027: 10,000 huellitas alimentadas con amor y esfuerzo en Arequipa.", 
                    textAlign: TextAlign.center, 
                    style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic)
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {}, 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange, 
                      foregroundColor: Colors.white, 
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text("SÉ PARTE DEL CAMBIO - 7 SOLES", style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 1. Grilla de Iconos (Estilo Yape)
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
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Divider(),
            ),

            // --- NUEVA SECCIÓN DESPLEGADA: LISTA DE ALBERGUES AREQUIPA ---
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Nuestros Albergues en Arequipa",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Renderizamos las tarjetas dinámicamente mapeando la lista
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: listaAlbergues.length,
              itemBuilder: (context, index) {
                final albergue = listaAlbergues[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  elevation: 4,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(10),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        albergue.imagenUrl,
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      albergue.nombre,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.location_on, size: 14, color: Colors.grey),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                albergue.ubicacion,
                                style: const TextStyle(fontSize: 12, color: Colors.grey),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Mascotas: ${albergue.cantidadPerros} | Meta: ${albergue.metaDonacion.toInt()} soles",
                          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.purple),
                        ),
                      ],
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.purple),
                    onTap: () {
                      // Al hacer clic, enviamos el albergue seleccionado a la pantalla de perfil
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PerfilAlbergueScreen(albergue: albergue),
                        ),
                      );
                    },
                  ),
                );
              },
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
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
            style: const TextStyle(fontSize: 11),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

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