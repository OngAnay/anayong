import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

// --- DEFINICIÓN DE MODELOS ---
class Albergue {
  final String id;
  final String nombre;
  final String ubicacion;
  final String resena;
  final String imagenUrl;
  final int cantidadPerros;
  final double metaDonacion;
  final double recaudado;

  Albergue({
    required this.id,
    required this.nombre,
    required this.ubicacion,
    required this.resena,
    required this.imagenUrl,
    required this.cantidadPerros,
    required this.metaDonacion,
    required this.recaudado,
  });
}

class AlertaMascota {
  final String tipo; // 'PERDIDO' o 'VISTO EN LA CALLE'
  final String descripcion;
  final String ubicacion;
  final String tiempo;
  final IconData icon;
  final Color color;

  AlertaMascota({
    required this.tipo,
    required this.descripcion,
    required this.ubicacion,
    required this.tiempo,
    required this.icon,
    required this.color,
  });
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ONG Añay',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple),
      initialRoute: '/', 
      routes: {
        '/': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/adopciones': (context) => const AlberguesScreen(),
        '/market_aliados': (context) => const AliadosScreen(),
        '/detalle_aliado': (context) => const DarkKitchenScreen(),
        '/catalogo': (context) => const TiendaScreen(),
        '/logistica': (context) => const DonacionesScreen(),
        '/alertas_comunidad': (context) => const AlertasComunidadScreen(),
        '/feet_videos': (context) => const FeetVideosScreen(),
        '/comunidades': (context) => const ComunidadesScreen(),
        '/carrito': (context) => const CarritoScreen(),
        '/perfil': (context) => const PerfilScreen(),
        '/historia': (context) => const HistoriaCompletaScreen(),
      },
    );
  }
}

// --- PANTALLA DETALLE DEL PERFIL DEL ALBERGUE (CON SU PROPIO MERCHANDISING) ---
class PerfilAlbergueScreen extends StatelessWidget {
  final Albergue albergue;
  const PerfilAlbergueScreen({super.key, required this.albergue});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(albergue.nombre), backgroundColor: Colors.purple),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(albergue.imagenUrl, height: 200, width: double.infinity, fit: BoxFit.cover),
              ),
              const SizedBox(height: 20),
              Text(albergue.nombre, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              Text(albergue.ubicacion, style: const TextStyle(color: Colors.grey)),
              const SizedBox(height: 15),
              Text(albergue.resena, style: const TextStyle(fontSize: 14, height: 1.4)),
              const SizedBox(height: 15),
              Text("Mascotas refugiadas: ${albergue.cantidadPerros}", style: const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 25),
              
              const Text("Merchandising de este Refugio", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.purple)),
              const Text("El 100% de estas compras van directo a este albergue.", style: TextStyle(fontSize: 12, color: Colors.grey, fontStyle: FontStyle.italic)),
              const Divider(),
              const SizedBox(height: 10),
              
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.85,
                children: [
                  _buildMerchItem("Polo Oficial Recaudación", "45 soles", Icons.checkroom),
                  _buildMerchItem("Taza Cerámica del Albergue", "25 soles", Icons.local_cafe),
                  _buildMerchItem("Pack Stickers Huellitas", "10 soles", Icons.layers),
                  _buildMerchItem("Gorra Protectora Bordada", "30 soles", Icons.face),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMerchItem(String nombre, String precio, IconData icon) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.purple.shade300),
            const SizedBox(height: 8),
            Text(nombre, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold), maxLines: 2, overflow: TextOverflow.ellipsis),
            const SizedBox(height: 4),
            Text(precio, style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 13)),
            const SizedBox(height: 6),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple, foregroundColor: Colors.white, minimumSize: const Size(double.infinity, 30), padding: EdgeInsets.zero),
              child: const Text("Agregar", style: TextStyle(fontSize: 11)),
            )
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 1. PANTALLA DE BIENVENIDA / LOGIN
// ==========================================
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const colorAcientoPacifico = Color(0xFF0077CC);
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 2),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, 4))],
                ),
                padding: const EdgeInsets.all(20),
                child: const Icon(Icons.pets, size: 70, color: colorAcientoPacifico),
              ),
              const SizedBox(height: 40),
              const Text("AÑAY", style: TextStyle(color: colorAcientoPacifico, fontSize: 42, fontWeight: FontWeight.w900, letterSpacing: 6)),
              const SizedBox(height: 10),
              Container(width: 60, height: 1.5, color: Colors.black87),
              const SizedBox(height: 15),
              const Text("Huellitas con Futuro", style: TextStyle(color: Colors.black54, fontSize: 16, fontWeight: FontWeight.w400)),
              const Spacer(flex: 3),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: OutlinedButton(
                  onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.black87,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    side: const BorderSide(color: Colors.black87, width: 1.5),
                  ),
                  child: const Text("Entrar como invitado", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
                ),
              ),
              const Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}

// ==========================================
// 2. PANTALLA PRINCIPAL (HOME)
// ==========================================
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = [
      _buildBanner("Publicidad La Dark Kitchen XL\n¡Porciones Grandes con Propósito!", Colors.orange),
      _buildBanner("Aliado Fit 2: Gimnasio Body Flex", Colors.blue),
      _buildBanner("Aliado Vet 3: Clínica Veterinaria", Colors.green),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("ONG Añay"),
        backgroundColor: Colors.purple,
        actions: [
          IconButton(icon: const Icon(Icons.shopping_cart), onPressed: () => Navigator.pushNamed(context, '/carrito')),
          IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
        ],
      ),
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
                  Text("Menú Añay", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                  Text("El Refugio Perfecto", style: TextStyle(color: Colors.white70, fontSize: 14)),
                ],
              ),
            ),
            ListTile(leading: const Icon(Icons.home, color: Colors.purple), title: const Text("Inicio"), onTap: () => Navigator.pop(context)),
            ListTile(leading: const Icon(Icons.pets, color: Colors.purple), title: const Text("Albergues"), onTap: () { Navigator.pop(context); Navigator.pushNamed(context, '/adopciones'); }),
            ListTile(leading: const Icon(Icons.shopping_bag, color: Colors.purple), title: const Text("Tienda Oficial"), onTap: () { Navigator.pop(context); Navigator.pushNamed(context, '/catalogo'); }),
            ListTile(leading: const Icon(Icons.handshake, color: Colors.purple), title: const Text("Socios Estratégicos"), onTap: () { Navigator.pop(context); Navigator.pushNamed(context, '/market_aliados'); }),
            ListTile(leading: const Icon(Icons.notification_important, color: Colors.red), title: const Text("Alertas de Emergencia"), onTap: () { Navigator.pop(context); Navigator.pushNamed(context, '/alertas_comunidad'); }),
            ListTile(leading: const Icon(Icons.volunteer_activism, color: Colors.purple), title: const Text("Logística de Donaciones"), onTap: () { Navigator.pop(context); Navigator.pushNamed(context, '/logistica'); }),
            ListTile(leading: const Icon(Icons.history, color: Colors.purple), title: const Text("Nuestra Historia"), onTap: () { Navigator.pop(context); Navigator.pushNamed(context, '/historia'); }),
            const Divider(),
            ListTile(leading: const Icon(Icons.exit_to_app, color: Colors.red), title: const Text("Cerrar Sesión"), onTap: () => Navigator.pushReplacementNamed(context, '/')),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // CONTEINER PRINCIPAL DEL VIDEO DE BIENVENIDA (QUIÉNES SOMOS)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 10)],
              ),
              child: Column(
                children: [
                  const Text("¿Quiénes Somos?", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.purple)),
                  const SizedBox(height: 4),
                  const Text("Conoce la ONG Añay (3 min)", style: TextStyle(fontSize: 13, color: Colors.grey, fontStyle: FontStyle.italic)),
                  const SizedBox(height: 12),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/historia'),
                    child: Container(
                      height: 180,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.black54, // <-- CAMBIADO DE Colors.blackDE A Colors.black54 CORRECCIÓN EXITOSA
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                          image: NetworkImage('https://images.unsplash.com/photo-1514373941175-0a141072bbc8?auto=format&fit=crop&q=80'),
                          fit: BoxFit.cover,
                          opacity: 0.6,
                        ),
                      ),
                      child: const Icon(Icons.play_circle_fill, size: 65, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Descubre cómo nació Añay, cuál es nuestra misión y cómo funciona este ecosistema auto-sostenible para proteger a las huellitas de Arequipa.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13, color: Colors.black87, height: 1.4),
                  ),
                  const SizedBox(height: 8),
                  const Text("Meta 2027: 10,000 huellitas alimentadas con amor.", textAlign: TextAlign.center, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.purple)),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, '/logistica'), 
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, foregroundColor: Colors.white, minimumSize: const Size(double.infinity, 50), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                    child: const Text("SÉ PARTE DEL CAMBIO - 7 SOLES", style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // RETÍCULA DE MENÚ PRINCIPAL
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 4,
              children: [
                _buildMenuIcon(context, Icons.pets, "Albergues", '/adopciones'),
                _buildMenuIcon(context, Icons.shopping_bag, "Tienda", '/catalogo'),
                _buildMenuIcon(context, Icons.handshake, "Aliados", '/market_aliados'),
                _buildMenuIcon(context, Icons.notification_important, "Alertas", '/alertas_comunidad'),
                _buildMenuIcon(context, Icons.restaurant, "XL Kitchen", '/detalle_aliado'),
                _buildMenuIcon(context, Icons.favorite, "Donar", '/logistica'),
                _buildMenuIcon(context, Icons.videocam, "Feet Videos", '/feet_videos'),
                _buildMenuIcon(context, Icons.grid_view, "Comunidades", '/comunidades'),
              ],
            ),
            const Padding(padding: EdgeInsets.symmetric(horizontal: 16.0), child: Divider()),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(alignment: Alignment.centerLeft, child: Text("Promociones de Aliados", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
            ),
            const SizedBox(height: 10),
            CarouselSlider(options: CarouselOptions(autoPlay: true, aspectRatio: 2.0, enlargeCenterPage: true), items: imageSliders),
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
          CircleAvatar(radius: 25, backgroundColor: Colors.purple.withValues(alpha: 0.1), child: Icon(icon, color: Colors.purple)),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontSize: 11), textAlign: TextAlign.center),
        ],
      ),
    );
  }

  Widget _buildBanner(String text, Color color) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(10.0)),
      child: Center(child: Text(text, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
    );
  }
}

// ==========================================
// 3. SECCIÓN: LOS 4 ALBERGUES
// ==========================================
class AlberguesScreen extends StatelessWidget {
  const AlberguesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Albergue> listaAlbergues = [
      Albergue(id: '1', nombre: 'Albergue Patitas Chiguata (Añay)', ubicacion: 'Distrito de Chiguata, Arequipa', resena: 'Sede central impulsada por la ONG Añay. Dedicados al rescate en las faldas del Misti, garantizando un refugio perfecto.', imagenUrl: 'https://images.unsplash.com/photo-1548199973-03cce0bbc87b?auto=format&fit=crop&q=80', cantidadPerros: 45, metaDonacion: 2000.0, recaudado: 1200.0),
      Albergue(id: '2', nombre: 'Refugio Canino Cono Norte', ubicacion: 'Cono Norte, Arequipa', resena: 'Espacio enfocado en rescatar perritos de zonas industriales, alimentación masiva y campañas de esterilización.', imagenUrl: 'https://images.unsplash.com/photo-1583511655857-d19b40a7a54e?auto=format&fit=crop&q=80', cantidadPerros: 60, metaDonacion: 3500.0, recaudado: 1800.0),
      Albergue(id: '3', nombre: 'Hogar Peluditos La 54', ubicacion: 'Sector La 54, Cerro Colorado, Arequipa', resena: 'Gestionado por voluntarios de la comunidad para rescatar animales abandonados en mercados y avenidas.', imagenUrl: 'https://images.unsplash.com/photo-1534361960057-19889db9621e?auto=format&fit=crop&q=80', cantidadPerros: 30, metaDonacion: 1500.0, recaudado: 900.0),
      Albergue(id: '4', nombre: 'Albergue Valle Verde Yumina', ubicacion: 'Sabandía - Yumina, Arequipa', resena: 'Refugio campestre en la campiña arequipeña enfocado en la recuperación de perritos que sufrieron maltrato.', imagenUrl: 'https://images.unsplash.com/photo-1601758228041-f3b2795255f1?auto=format&fit=crop&q=80', cantidadPerros: 25, metaDonacion: 2500.0, recaudado: 2100.0),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Nuestros Albergues"), backgroundColor: Colors.purple),
      body: ListView.builder(
        itemCount: listaAlbergues.length,
        itemBuilder: (context, index) {
          final albergue = listaAlbergues[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 4,
            child: ListTile(
              contentPadding: const EdgeInsets.all(10),
              leading: ClipRRect(borderRadius: BorderRadius.circular(10), child: Image.network(albergue.imagenUrl, width: 60, height: 60, fit: BoxFit.cover)),
              title: Text(albergue.nombre, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("Mascotas: ${albergue.cantidadPerros}\n${albergue.ubicacion}", style: const TextStyle(fontSize: 12)),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.purple),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PerfilAlbergueScreen(albergue: albergue)));
              },
            ),
          );
        },
      ),
    );
  }
}

// ==========================================
// 4. SECCIÓN: MARKET DE SOCIOS ESTRATÉGICOS
// ==========================================
class AliadosScreen extends StatelessWidget {
  const AliadosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Socios Estratégicos"), backgroundColor: Colors.purple),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text("Ecosistema Aliado", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.purple)),
          const Text("Negocios que transforman sus ventas en apoyo real.", style: TextStyle(fontSize: 13, color: Colors.grey)),
          const SizedBox(height: 20),
          
          const _HeaderCategoria(titulo: "Gastronomía Solidaria", icon: Icons.restaurant_menu),
          Card(
            child: ListTile(
              leading: const Icon(Icons.restaurant, color: Colors.orange, size: 30),
              title: const Text("La Dark Kitchen XL", style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: const Text("Consume y acumula puntos de ayuda."),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.pushNamed(context, '/detalle_aliado'),
            ),
          ),
          
          const SizedBox(height: 15),
          const _HeaderCategoria(titulo: "Gimnasios y Centros Fit", icon: Icons.fitness_center),
          Card(
            child: ListTile(
              leading: const Icon(Icons.directions_run, color: Colors.blue, size: 30),
              title: const Text("Gimnasio Body Flex Arequipa"),
              subtitle: const Text("Socio estratégico comunitario."),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
            ),
          ),
          
          const SizedBox(height: 15),
          const _HeaderCategoria(titulo: "Clínicas Veterinarias Aliadas", icon: Icons.local_hospital),
          Card(
            child: ListTile(
              leading: const Icon(Icons.medical_services, color: Colors.green, size: 30),
              title: const Text("Clínica Veterinaria San José"),
              subtitle: const Text("Soporte de salud integral para rescates."),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderCategoria extends StatelessWidget {
  final String titulo;
  final IconData icon;
  const _HeaderCategoria({required this.titulo, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.purple.shade400),
          const SizedBox(width: 8),
          Text(titulo, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87)),
        ],
      ),
    );
  }
}

// ==========================================
// 5. SECCIÓN: LA DARK KITCHEN XL
// ==========================================
class DarkKitchenScreen extends StatelessWidget {
  const DarkKitchenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("La Dark Kitchen XL"), backgroundColor: Colors.orange),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.orange.shade100, borderRadius: BorderRadius.circular(15)),
                child: const Icon(Icons.fastfood, size: 70, color: Colors.orange),
              ),
              const SizedBox(height: 20),
              const Text("La Dark Kitchen XL", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const Text("Socio Estratégico Oficial", style: TextStyle(fontSize: 14, color: Colors.grey, fontStyle: FontStyle.italic)),
              const SizedBox(height: 15),
              
              const Text("¿Cómo ganar puntos para los albergues?", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.orange)),
              const Divider(),
              const ListTile(
                leading: Icon(Icons.qr_code_scanner, color: Colors.orange),
                title: Text("1. Escanea tu comprobante"),
                subtitle: Text("Cada consumo en La Dark Kitchen XL acumula puntos directos a tu cuenta."),
              ),
              const ListTile(
                leading: Icon(Icons.volunteer_activism, color: Colors.orange),
                title: Text("2. Canjea por impacto"),
                subtitle: Text("Tus puntos acumulados se transforman en sacos de alimento donados por el aliado."),
              ),
              const SizedBox(height: 30),
              
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.launch),
                label: const Text("IR A LA DARK KITCHEN XL", style: TextStyle(fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ==========================================
// 6. SECCIÓN: TIENDA DE MERCHANDISING GENERAL
// ==========================================
class TiendaScreen extends StatelessWidget {
  const TiendaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tienda Oficial Añay"), backgroundColor: Colors.purple),
      body: GridView.count(
        padding: const EdgeInsets.all(16),
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.75,
        children: [
          _buildProductoCard("Polos Oficiales Añay", "45 soles", Icons.checkroom),
          _buildProductoCard("Correas Fuertes para Perro", "30 soles", Icons.vpn_key),
          _buildProductoCard("Ropa de Invierno Mascotas", "35 soles", Icons.pets),
          _buildProductoCard("Toallas Bordadas Grandes", "40 soles", Icons.texture),
          _buildProductoCard("Tazas Térmicas Añay", "25 soles", Icons.local_cafe),
          _buildProductoCard("Cafeteras / Termos", "90 soles", Icons.coffee_maker),
        ],
      ),
    );
  }

  Widget _buildProductoCard(String nombre, String precio, IconData icon) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(radius: 30, backgroundColor: Colors.purple.withValues(alpha: 0.1), child: Icon(icon, size: 35, color: Colors.purple)),
            const SizedBox(height: 12),
            Text(nombre, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13), maxLines: 2, overflow: TextOverflow.ellipsis),
            const SizedBox(height: 4),
            Text(precio, style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 14)),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {}, 
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
              child: const Text("Comprar", style: TextStyle(fontSize: 12)),
            )
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 7. SECCIÓN: LOGÍSTICA DE DONACIONES
// ==========================================
class DonacionesScreen extends StatelessWidget {
  const DonacionesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Donaciones y Soporte"), backgroundColor: Colors.purple),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("¿Cómo deseas apoyar hoy?", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            _buildDonacionOption("Donación Rápida (Suscripción)", "S/. 7 al mes para alimentar una huellita", Icons.volunteer_activism, Colors.orange),
            _buildDonacionOption("Donar Alimento o Medicina", "Coordinar entrega o recojo logístico", Icons.local_shipping, Colors.blue),
            _buildDonacionOption("Apoyo Económico Voluntario", "Transferencias directas cuentas ONG", Icons.account_balance_wallet, Colors.green),
          ],
        ),
      ),
    );
  }

  Widget _buildDonacionOption(String titulo, String subtitulo, IconData icon, Color color) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: CircleAvatar(backgroundColor: color.withValues(alpha: 0.1), child: Icon(icon, color: color)),
        title: Text(titulo, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitulo),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {},
      ),
    );
  }
}

// ==========================================
// 8. MÓDULO: ALERTAS DE EMBERGENCIA COMUNITARIA
// ==========================================
class AlertasComunidadScreen extends StatelessWidget {
  const AlertasComunidadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<AlertaMascota> reportesRecientes = [
      AlertaMascota(tipo: "PERDIDO", descripcion: "Pug color arena con collar rojo, asustado.", ubicacion: "Cercado, frente al Parque Selva Alegre", tiempo: "Hace 10 min", icon: Icons.warning, color: Colors.red),
      AlertaMascota(tipo: "VISTO EN LA CALLE", descripcion: "Perrito mestizo grande buscando comida cerca a contenedores.", ubicacion: "Cayma, Av. Ejército cuadra 5", tiempo: "Hace 45 min", icon: Icons.visibility, color: Colors.orange),
      AlertaMascota(tipo: "PERDIDO", descripcion: "Husky de ojos azules, responde al nombre de 'Max'.", ubicacion: "Yanahuara, Plaza Principal", tiempo: "Hace 2 horas", icon: Icons.warning, color: Colors.red),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Alertas de Emergencia"), backgroundColor: Colors.red.shade700),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.red.shade50,
            child: Row(
              children: [
                Icon(Icons.gpp_maybe, color: Colors.red.shade700, size: 40),
                const SizedBox(width: 12),
                const Expanded(
                  child: Text(
                    "Si ves una mascota perdida, tómale una foto y repórtala. Toda la comunidad Añay recibirá una Alerta Push al instante.",
                    style: TextStyle(fontSize: 13, color: Colors.black87, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.red.shade900,
                    content: Row(
                      children: const [
                        Icon(Icons.notification_important, color: Colors.white),
                        SizedBox(width: 10),
                        Expanded(child: Text("¡ALERTA PUSH ENVIADA a usuarios cercanos en Arequipa!")),
                      ],
                    ),
                    duration: const Duration(seconds: 3),
                  ),
                );
              },
              icon: const Icon(Icons.add_a_photo),
              label: const Text("REPORTAR MASCOTA PERDIDA / VISTA"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade700,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text("Reportes Recientes en la Zona", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: reportesRecientes.length,
              itemBuilder: (context, index) {
                final alerta = reportesRecientes[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: alerta.color.withValues(alpha: 0.1),
                      child: Icon(alerta.icon, color: alerta.color),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(alerta.tipo, style: TextStyle(color: alerta.color, fontWeight: FontWeight.w900, fontSize: 12, letterSpacing: 1)),
                        Text(alerta.tiempo, style: const TextStyle(color: Colors.grey, fontSize: 11)),
                      ],
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(alerta.descripcion, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87)),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(Icons.location_on, size: 12, color: Colors.grey),
                              const SizedBox(width: 4),
                              Expanded(child: Text(alerta.ubicacion, style: const TextStyle(fontSize: 12, color: Colors.grey), overflow: TextOverflow.ellipsis)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// 9. SECCIÓN: FEET VIDEOS
// ==========================================
class FeetVideosScreen extends StatelessWidget {
  const FeetVideosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Feet Videos - Día a Día"), backgroundColor: Colors.purple),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 3,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 10),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Column(
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: const BoxDecoration(color: Colors.black87, borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
                  child: const Icon(Icons.play_circle_outline, size: 50, color: Colors.white),
                ),
                ListTile(
                  title: Text("Actualización del Albergue #${index + 1}"),
                  subtitle: const Text("Mira cómo disfrutan las donaciones de esta semana."),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// ==========================================
// 10. SECCIÓN: COMUNIDADES
// ==========================================
class ComunidadesScreen extends StatelessWidget {
  const ComunidadesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Comunidades y Redes"), backgroundColor: Colors.purple),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Card(
            child: ListTile(
              leading: Icon(Icons.chat, color: Colors.green),
              title: Text("Grupo de Rescatistas Chiguata"),
              subtitle: Text("Coordinación de brigadas de asistencia."),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.campaign, color: Colors.orange),
              title: Text("Alertas de Adopciones urgentes"),
              subtitle: Text("Espacio para compartir casos comunitarios."),
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// 11. SECCIÓN: CARRITO DE COMPRAS
// ==========================================
class CarritoScreen extends StatelessWidget {
  const CarritoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mi Carrito"), backgroundColor: Colors.purple),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_cart_checkout, size: 70, color: Colors.grey.shade400),
            const SizedBox(height: 15),
            const Text("Tu carrito está vacío", style: TextStyle(fontSize: 18, color: Colors.black54)),
            const SizedBox(height: 5),
            const Text("Agrega productos de nuestra Tienda Oficial.", style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 12. SECCIÓN: MI PERFIL
// ==========================================
class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mi Perfil"), backgroundColor: Colors.purple),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const CircleAvatar(radius: 55, backgroundColor: Colors.purple, child: Icon(Icons.person, size: 60, color: Colors.white)),
            const SizedBox(height: 15),
            const Text("Usuario Añay", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const Text("Arequipa, Perú", style: TextStyle(color: Colors.grey)),
            const Divider(height: 40),
            const ListTile(leading: Icon(Icons.favorite_border), title: Text("Mis Huellitas Apadrinadas")),
            const ListTile(leading: Icon(Icons.history_toggle_off), title: Text("Historial de Aportes")),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 13. SECCIÓN: NUESTRA HISTORIA COMPLETA
// ==========================================
class HistoriaCompletaScreen extends StatelessWidget {
  const HistoriaCompletaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Nuestra Historia"), backgroundColor: Colors.purple),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Nuestra Misión y Visión", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.purple)),
            SizedBox(height: 15),
            Text(
              "ONG Añay nació bajo la premisa de ser el refugio perfecto. No nos limitamos a un espacio físico de rescate, sino que creamos un ecosistema sostenible donde la gastronomía local, el deporte y la tecnología se unen para financiar la calidad de vida de miles de animales abandonados.",
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}