import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart'; // IMPORTACIÓN DEL PAQUETE DE ENLACES

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
    // PALETA GLOBAL CELESTE PARA EL INTERIOR
    const Color colorPrincipalApp = Colors.lightBlue; 

    return MaterialApp(
      title: 'ONG Añay',
      debugShowCheckedModeBanner: false,
      
      // CONFIGURACIÓN PARA EL INTERIOR (FONDO BLANCO CON CELESTE)
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: colorPrincipalApp,
        scaffoldBackgroundColor: Colors.white, // Fondo blanco para el interior
        cardColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: colorPrincipalApp,
          primary: colorPrincipalApp,
          brightness: Brightness.light,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: colorPrincipalApp,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),

      // CONFIGURACIÓN EXCLUSIVA PARA EL LOGIN (MANTIENE EL FONDO NEGRO PREMIUM)
      darkTheme: ThemeData(
        useMaterial3: true,
        primaryColor: Colors.purpleAccent,
        scaffoldBackgroundColor: const Color(0xFF0F0F10), // Tu inicio negro
        cardColor: const Color(0xFF1E1E20),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purpleAccent,
          primary: Colors.purpleAccent,
          brightness: Brightness.dark,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1E1E20),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      
      themeMode: ThemeMode.light, // Controla el flujo claro/oscuro de manera unificada
      initialRoute: '/', 
      routes: {
        '/': (context) => const LoginScreen(), // Carga con su propio diseño oscuro
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

// ==========================================
// PANTALLA DETALLE DEL PERFIL DEL ALBERGUE (CON BOTÓN DE WHATSAPP OPERATIVO)
// ==========================================
class PerfilAlbergueScreen extends StatelessWidget {
  final Albergue albergue;
  const PerfilAlbergueScreen({super.key, required this.albergue});

  // FUNCIÓN NATIVA PARA DISPARAR LA APLICACIÓN DE WHATSAPP
  Future<void> _abrirWhatsApp(BuildContext context) async {
    // Puedes reemplazar el '51999999999' por el celular real de cada albergue más adelante
    final String mensaje = "Hola, vengo de la App Añay. Deseo información sobre el albergue: ${albergue.nombre}";
    final Uri url = Uri.parse("https://wa.me/51999999999?text=${Uri.encodeComponent(mensaje)}");
    
    try {
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        throw 'No se pudo abrir WhatsApp';
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No se pudo abrir WhatsApp en este dispositivo')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.primaryColor;

    return Scaffold(
      appBar: AppBar(title: Text(albergue.nombre)), 
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
              Text(albergue.ubicacion, style: TextStyle(color: theme.hintColor)),
              const SizedBox(height: 15),
              Text(albergue.resena, style: const TextStyle(fontSize: 14, height: 1.4)),
              const SizedBox(height: 15),
              Text("Mascotas refugiadas: ${albergue.cantidadPerros}", style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 16)),
              
              const SizedBox(height: 15),
              // --- NUEVO BOTÓN DE WHATSAPP INTEGRADO ---
              ElevatedButton.icon(
                onPressed: () => _abrirWhatsApp(context),
                icon: const Icon(Icons.chat, color: Colors.white, size: 20), // Usamos ícono de chat nativo por compatibilidad estricta
                label: const Text("CONVERSAR POR WHATSAPP", style: TextStyle(fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
              
              const SizedBox(height: 25),
              Text("Merchandising de este Refugio", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: primaryColor)),
              Text("El 100% de estas compras van directo a este albergue.", style: TextStyle(fontSize: 12, color: theme.hintColor, fontStyle: FontStyle.italic)),
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
                  _buildMerchItem(context, "Polo Oficial Recaudación", "45 soles", Icons.checkroom, primaryColor),
                  _buildMerchItem(context, "Taza Cerámica del Albergue", "25 soles", Icons.local_cafe, primaryColor),
                  _buildMerchItem(context, "Pack Stickers Huellitas", "10 soles", Icons.layers, primaryColor),
                  _buildMerchItem(context, "Gorra Protectora Bordada", "30 soles", Icons.face, primaryColor),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMerchItem(BuildContext context, String nombre, String precio, IconData icon, Color color) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: color.withValues(alpha: 0.6)),
            const SizedBox(height: 8),
            Text(nombre, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold), maxLines: 2, overflow: TextOverflow.ellipsis),
            const SizedBox(height: 4),
            Text(precio, style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 13)),
            const SizedBox(height: 6),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: color, 
                foregroundColor: Colors.white, 
                minimumSize: const Size(double.infinity, 30), 
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text("Agregar", style: TextStyle(fontSize: 11)),
            )
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 1. PANTALLA DE BIENVENIDA / LOGIN (FORZADA A OSCURO)
// ==========================================
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const darkBg = Color(0xFF0F0F10);
    const purpleLogo = Colors.purpleAccent;

    return Scaffold(
      backgroundColor: darkBg, 
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
                  color: const Color(0xFF1E1E20),
                  boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, 4))],
                ),
                padding: const EdgeInsets.all(20),
                child: const Icon(Icons.pets, size: 70, color: purpleLogo),
              ),
              const SizedBox(height: 40),
              const Text("AÑAY", style: TextStyle(color: purpleLogo, fontSize: 42, fontWeight: FontWeight.w900, letterSpacing: 6)),
              const SizedBox(height: 10),
              Container(width: 60, height: 1.5, color: Colors.white24),
              const SizedBox(height: 15),
              const Text("Huellitas con Futuro", style: TextStyle(color: Colors.white60, fontSize: 16, fontWeight: FontWeight.w400)),
              const Spacer(flex: 3),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: OutlinedButton(
                  onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    side: const BorderSide(color: Colors.white70, width: 1.5),
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
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;

    final List<Widget> imageSliders = [
      _buildBanner("Publicidad La Dark Kitchen XL\n¡Porciones Grandes con Propósito!", Colors.orange),
      _buildBanner("Aliado Fit 2: Gimnasio Body Flex", Colors.blue),
      _buildBanner("Aliado Vet 3: Clínica Veterinaria", Colors.green),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("ONG Añay"),
        actions: [
          IconButton(icon: const Icon(Icons.shopping_cart), onPressed: () => Navigator.pushNamed(context, '/carrito')),
          IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: primaryColor),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Menú Añay", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                  Text("El Refugio Perfecto", style: TextStyle(color: Colors.white70, fontSize: 14)),
                ],
              ),
            ),
            ListTile(leading: Icon(Icons.home, color: primaryColor), title: const Text("Inicio"), onTap: () => Navigator.pop(context)),
            ListTile(leading: Icon(Icons.pets, color: primaryColor), title: const Text("Albergues"), onTap: () { Navigator.pop(context); Navigator.pushNamed(context, '/adopciones'); }),
            ListTile(leading: Icon(Icons.shopping_bag, color: primaryColor), title: const Text("Tienda Oficial"), onTap: () { Navigator.pop(context); Navigator.pushNamed(context, '/catalogo'); }),
            ListTile(leading: Icon(Icons.handshake, color: primaryColor), title: const Text("Socios Estratégicos"), onTap: () { Navigator.pop(context); Navigator.pushNamed(context, '/market_aliados'); }),
            ListTile(leading: const Icon(Icons.notification_important, color: Colors.red), title: const Text("Alertas de Emergencia"), onTap: () { Navigator.pop(context); Navigator.pushNamed(context, '/alertas_comunidad'); }),
            ListTile(leading: Icon(Icons.volunteer_activism, color: primaryColor), title: const Text("Logística de Donaciones"), onTap: () { Navigator.pop(context); Navigator.pushNamed(context, '/logistica'); }),
            ListTile(leading: Icon(Icons.history, color: primaryColor), title: const Text("Nuestra Historia"), onTap: () { Navigator.pop(context); Navigator.pushNamed(context, '/historia'); }),
            ListTile(leading: Icon(Icons.person, color: primaryColor), title: const Text("Mi Perfil"), onTap: () { Navigator.pop(context); Navigator.pushNamed(context, '/perfil'); }),
            const Divider(),
            ListTile(leading: const Icon(Icons.exit_to_app, color: Colors.red), title: const Text("Cerrar Sesión"), onTap: () => Navigator.pushReplacementNamed(context, '/')),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10)],
              ),
              child: Column(
                children: [
                  Text("¿Quiénes Somos?", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: primaryColor)),
                  const SizedBox(height: 4),
                  Text("Conoce la ONG Añay (3 min)", style: const TextStyle(fontSize: 13, color: Colors.grey, fontStyle: FontStyle.italic)),
                  const SizedBox(height: 12),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/historia'),
                    child: Container(
                      height: 180,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.black54,
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
                  Text("Meta 2027: 10,000 huellitas alimentadas con amor.", textAlign: TextAlign.center, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: primaryColor)),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, '/logistica'), 
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, foregroundColor: Colors.white, minimumSize: const Size(double.infinity, 50), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                    child: const Text("SÉ PARTE DEL CAMBIO - 50 SOLES", style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 4,
              children: [
                _buildMenuIcon(context, Icons.pets, "Albergues", '/adopciones', primaryColor),
                _buildMenuIcon(context, Icons.shopping_bag, "Tienda", '/catalogo', primaryColor),
                _buildMenuIcon(context, Icons.handshake, "Aliados", '/market_aliados', primaryColor),
                _buildMenuIcon(context, Icons.notification_important, "Alertas", '/alertas_comunidad', primaryColor),
                _buildMenuIcon(context, Icons.restaurant, "XL Kitchen", '/detalle_aliado', primaryColor),
                _buildMenuIcon(context, Icons.favorite, "Donar", '/logistica', primaryColor),
                _buildMenuIcon(context, Icons.videocam, "Feet Videos", '/feet_videos', primaryColor),
                _buildMenuIcon(context, Icons.grid_view, "Comunidades", '/comunidades', primaryColor),
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

  Widget _buildMenuIcon(BuildContext context, IconData icon, String label, String route, Color color) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(radius: 25, backgroundColor: color.withValues(alpha: 0.1), child: Icon(icon, color: color)),
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
    final theme = Theme.of(context);

    final List<Albergue> listaAlbergues = [
      Albergue(id: '1', nombre: 'Albergue Patitas Chiguata (Añay)', ubicacion: 'Distrito de Chiguata, Arequipa', resena: 'Sede central impulsada por la ONG Añay. Dedicados al rescate en las faldas del Misti, garantizando un refugio perfecto.', imagenUrl: 'https://images.unsplash.com/photo-1548199973-03cce0bbc87b?auto=format&fit=crop&q=80', cantidadPerros: 45, metaDonacion: 2000.0, recaudado: 1200.0),
      Albergue(id: '2', nombre: 'Refugio Canino Cono Norte', ubicacion: 'Cono Norte, Arequipa', resena: 'Espacio enfocado en rescatar perritos de zonas industriales, alimentación masiva y campaigns de esterilización.', imagenUrl: 'https://images.unsplash.com/photo-1583511655857-d19b40a7a54e?auto=format&fit=crop&q=80', cantidadPerros: 60, metaDonacion: 3500.0, recaudado: 1800.0),
      Albergue(id: '3', nombre: 'Hogar Peluditos La 54', ubicacion: 'Sector La 54, Cerro Colorado, Arequipa', resena: 'Gestionado por volunteers de la comunidad para rescatar animales abandonados en markets and avenues.', imagenUrl: 'https://images.unsplash.com/photo-1534361960057-19889db9621e?auto=format&fit=crop&q=80', cantidadPerros: 30, metaDonacion: 1500.0, recaudado: 900.0),
      Albergue(id: '4', nombre: 'Albergue Valle Verde Yumina', ubicacion: 'Sabandía - Yumina, Arequipa', resena: 'Refugio campestre en la campiña arequipeña enfocado en la recuperación de perritos que sufrieron maltrato.', imagenUrl: 'https://images.unsplash.com/photo-1601758228041-f3b2795255f1?auto=format&fit=crop&q=80', cantidadPerros: 25, metaDonacion: 2500.0, recaudado: 2100.0),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Nuestros Albergues")),
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
              trailing: Icon(Icons.arrow_forward_ios, size: 16, color: theme.colorScheme.primary),
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
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text("Socios Estratégicos")),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Text("Ecosistema Aliado", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: theme.colorScheme.primary)),
          Text("Negocios que transforman sus ventas en apoyo real.", style: const TextStyle(fontSize: 13, color: Colors.grey)),
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
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, size: 20, color: theme.colorScheme.primary.withValues(alpha: 0.8)),
          const SizedBox(width: 8),
          Text(titulo, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: theme.colorScheme.onSurface)),
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
      appBar: AppBar(title: const Text("La Dark Kitchen XL"), backgroundColor: Colors.orange, foregroundColor: Colors.white),
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
              Text("Socio Estratégico Oficial - Sabores que Unen", style: TextStyle(fontSize: 14, color: Theme.of(context).hintColor, fontStyle: FontStyle.italic)),
              const SizedBox(height: 15),
              
              const Text("¿Cómo ganar puntos para los albergues?", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.orange)),
              const Divider(),
              const ListTile(
                leading: Icon(Icons.qr_code_scanner, color: Colors.orange),
                title: Text("1. Escanea tu comprobante"),
                subtitle: Text("Cada porción XL comprada (entre 35 y 45 soles o nuestro plato fuerte de 80 soles) suma huellitas directo a los refugios."),
              ),
              const ListTile(
                leading: Icon(Icons.volunteer_activism, color: Colors.orange),
                title: Text("2. Canjea por impacto"),
                subtitle: Text("Tus consumos se traducen en sacos de comida comprados directamente en Río Seco para mantener llenos los platos de los albergues."),
              ),
              const SizedBox(height: 30),
              
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.launch),
                label: const Text("IR A PEDIR A LA DARK KITCHEN XL", style: TextStyle(fontWeight: FontWeight.bold)),
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
      appBar: AppBar(title: const Text("Tienda Oficial Añay")),
      body: GridView.count(
        padding: const EdgeInsets.all(16),
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.75,
        children: [
          _buildProductoCard(context, "Polos Oficiales Añay", "45 soles", Icons.checkroom),
          _buildProductoCard(context, "Correas Fuertes para Perro", "30 soles", Icons.vpn_key),
          _buildProductoCard(context, "Ropa de Invierno Mascotas", "35 soles", Icons.pets),
          _buildProductoCard(context, "Toallas Bordadas Grandes", "40 soles", Icons.texture),
          _buildProductoCard(context, "Tazas Térmicas Añay", "25 soles", Icons.local_cafe),
          _buildProductoCard(context, "Cafeteras / Termos", "90 soles", Icons.coffee_maker),
        ],
      ),
    );
  }

  Widget _buildProductoCard(BuildContext context, String nombre, String precio, IconData icon) {
    final theme = Theme.of(context);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(radius: 30, backgroundColor: theme.colorScheme.primary.withValues(alpha: 0.1), child: Icon(icon, size: 35, color: theme.colorScheme.primary)),
            const SizedBox(height: 12),
            Text(nombre, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13), maxLines: 2, overflow: TextOverflow.ellipsis),
            const SizedBox(height: 4),
            Text(precio, style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 14)),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {}, 
              style: ElevatedButton.styleFrom(backgroundColor: theme.colorScheme.primary, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
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
      appBar: AppBar(title: const Text("Donaciones y Soporte")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("¿Cómo deseas apoyar hoy?", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            _buildDonacionOption("Donación Rápida (Suscripción)", "50 soles al mes para alimentar una huellita", Icons.volunteer_activism, Colors.orange),
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
// 8. MÓDULO: ALERTAS DE EMERGENCIA COMUNITARIA
// ==========================================
class AlertasComunidadScreen extends StatelessWidget {
  const AlertasComunidadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<AlertaMascota> reportesRecientes = [
      AlertaMascota(tipo: "PERDIDO", descripcion: "Pug color arena con collar rojo, asustado.", ubicacion: "Cercado, frente al Parque Selva Alegre", tiempo: "Hace 10 min", icon: Icons.warning, color: Colors.red),
      AlertaMascota(tipo: "VISTO EN LA CALLE", descripcion: "Perrito mestizo grande buscando comida cerca a contenedores.", ubicacion: "Cayma, Av. Ejército cuadra 5", tiempo: "Hace 45 min", icon: Icons.visibility, color: Colors.orange),
      AlertaMascota(tipo: "PERDIDO", descripcion: "Husky de ojos azules, responde al nombre de 'Max'.", ubicacion: "Paucarpata, Av. Kennedy", tiempo: "Hace 1 hora", icon: Icons.warning, color: Colors.red),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Alertas de la Comunidad")),
      body: ListView.builder(
        itemCount: reportesRecientes.length,
        itemBuilder: (context, index) {
          final alerta = reportesRecientes[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: CircleAvatar(backgroundColor: alerta.color.withValues(alpha: 0.1), child: Icon(alerta.icon, color: alerta.color)),
              title: Row(
                children: [
                  Text(alerta.tipo, style: TextStyle(color: alerta.color, fontWeight: FontWeight.bold, fontSize: 12)),
                  const Spacer(),
                  Text(alerta.tiempo, style: const TextStyle(color: Colors.grey, fontSize: 11)),
                ],
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 6.0), 
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(alerta.descripcion, style: const TextStyle(fontWeight: FontWeight.w500)),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.location_on, size: 12, color: Colors.grey),
                        const SizedBox(width: 4),
                        Expanded(child: Text(alerta.ubicacion, style: const TextStyle(color: Colors.grey, fontSize: 12), overflow: TextOverflow.ellipsis)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// ==========================================
// 9. MÓDULO: FEET VIDEOS (ESTILO REELS / STORIES)
// ==========================================
class FeetVideosScreen extends StatelessWidget {
  const FeetVideosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final List<Map<String, String>> videosDummy = [
      {"titulo": "Almuerzo XL en Albergue Chiguata 🐾", "vistas": "1.2K vistas", "tags": "#Añay #Chiguata"},
      {"titulo": "Rescate feliz en las faldas del Misti", "vistas": "850 vistas", "tags": "#Adoptado #Arequipa"},
      {"titulo": "Día de baño y mimos en Cono Norte", "vistas": "2.4K vistas", "tags": "#Peluditos #SanJosé"},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Feet Videos - Historias")),
      body: ListView.builder(
        itemCount: videosDummy.length,
        itemBuilder: (context, index) {
          final item = videosDummy[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 3,
            child: Column(
              children: [
                Container(
                  height: 220,
                  color: Colors.black87,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned.fill(
                        child: Image.network(
                          'https://images.unsplash.com/photo-1543466835-00a7907e9de1?auto=format&fit=crop&q=80',
                          fit: BoxFit.cover,
                          color: Colors.black.withValues(alpha: 0.5),
                          colorBlendMode: BlendMode.darken,
                        ),
                      ),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: theme.colorScheme.primary.withValues(alpha: 0.8),
                        child: Icon(Icons.play_arrow, size: 40, color: Colors.white),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 10,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(5)),
                          child: Text(item["vistas"]!, style: const TextStyle(color: Colors.white, fontSize: 11)),
                        ),
                      )
                    ],
                  ),
                ),
                ListTile(
                  title: Text(item["titulo"]!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  subtitle: Text(item["tags"]!, style: TextStyle(color: theme.colorScheme.primary, fontSize: 12, fontWeight: FontWeight.w500)),
                  trailing: IconButton(
                    icon: const Icon(Icons.favorite, color: Colors.red),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

// ==========================================
// 10. MÓDULO: COMUNIDADES (FOROS DE AYUDA)
// ==========================================
class ComunidadesScreen extends StatelessWidget {
  const ComunidadesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final List<Map<String, dynamic>> canales = [
      {"nombre": "Campaña Esterilizaciones 2026", "miembros": "340 activos", "icon": Icons.medical_services, "color": Colors.green},
      {"nombre": "Voluntarios Albergue Chiguata", "miembros": "120 activos", "icon": Icons.group, "color": Colors.purple},
      {"nombre": "Red de Rescate y Denuncias AQPs", "miembros": "512 activos", "icon": Icons.gavel, "color": Colors.red},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Comunidades Añay")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Únete a los Canales de Ayuda", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Text("Coordina en tiempo real con brigadas de rescate en Arequipa.", style: TextStyle(color: theme.hintColor, fontSize: 13)),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: canales.length,
                itemBuilder: (context, index) {
                  final canal = canales[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 2,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: canal["color"].withValues(alpha: 0.1),
                        child: Icon(canal["icon"], color: canal["color"]),
                      ),
                      title: Text(canal["nombre"], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                      subtitle: Text("Miembros: ${canal["miembros"]}", style: const TextStyle(fontSize: 12)),
                      trailing: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: theme.colorScheme.primary,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        child: const Text("Entrar", style: TextStyle(fontSize: 12)),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ==========================================
// PANTALLAS COMPLEMENTARIAS RESTANTES
// ==========================================
class CarritoScreen extends StatelessWidget { const CarritoScreen({super.key}); @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text("Carrito")), body: const Center(child: Text("Tu carrito está vacío"))); }
class HistoriaCompletaScreen extends StatelessWidget { const HistoriaCompletaScreen({super.key}); @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text("Nuestra Historia")), body: const Padding(padding: EdgeInsets.all(16.0), child: Text("ONG Añay nació con la misión de unificar los albergues de Arequipa bajo un modelo auto-sostenible..."))); }

// ==========================================
// PANTALLA: PERFIL DEL USUARIO & PROGRAMA DE LEALTAD
// ==========================================
class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;

    return Scaffold(
      backgroundColor: const Color(0xFFF8FBFD),
      appBar: AppBar(
        title: const Text("Mi Perfil Solidario"),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeaderPerfil(),
            Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --- BILLETERA DE LEALTAD & CASHBACK ---
                  Text(
                    "Tu Billetera de Lealtad XL",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: primaryColor),
                  ),
                  const SizedBox(height: 15),
                  _buildMonederoCashback(context),
                  const SizedBox(height: 35),

                  // --- SECCIÓN DE IMPACTO ---
                  const Text(
                    "Mi Impacto Añay",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 20),
                  _buildStatsRow(primaryColor),
                  const SizedBox(height: 35),

                  // --- MENÚ DE OPCIONES ---
                  const Text(
                    "Opciones",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 15),
                  _buildOpcionMenu(Icons.person_outline, "Mis Datos", "Edita tu información personal", primaryColor),
                  _buildOpcionMenu(Icons.favorite_border, "Mis Adopciones", "Mira tus procesos actuales", primaryColor),
                  _buildOpcionMenu(Icons.history, "Historial de Consumos", "Validaciones de La Dark Kitchen XL, Yape y Plin", primaryColor),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderPerfil() {
    return Container(
      padding: const EdgeInsets.only(top: 30, bottom: 30),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
      ),
      child: const Column(
        children: [
          CircleAvatar(
            radius: 50, 
            backgroundColor: Colors.lightBlueAccent,
            child: Icon(Icons.person, size: 55, color: Colors.white),
          ),
          SizedBox(height: 15),
          Text("Brendon Beltrán", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Text("Socio Benefactor Añay", style: TextStyle(color: Colors.grey, fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildMonederoCashback(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.lightBlue, Colors.purpleAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Dinero Canjeable / Cashback", style: TextStyle(color: Colors.white70, fontSize: 13, fontWeight: FontWeight.w500)),
                Icon(Icons.wallet, color: Colors.white70, size: 20),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              "2000 soles", 
              style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.qr_code_scanner, size: 16),
                    label: const Text("Validar Yape / Plin", style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.lightBlue,
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.volunteer_activism, size: 16, color: Colors.white),
                    label: const Text("Donar Cashback", style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.white)),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.white, width: 1.5),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildStatsRow(Color activeColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildStatCard("🐾 12", "Huellitas\nApoyadas"),
        _buildStatCard("🍗 45 kg", "Alimento\nDonado"),
        _buildStatCard("🔥 XL", "Nivel de\nSocio"),
      ],
    );
  }

  Widget _buildStatCard(String valor, String etiqueta) {
    return Expanded(
      child: Card(
        color: Colors.white,
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          child: Column(
            children: [
              Text(valor, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.lightBlue)),
              const SizedBox(height: 4),
              Text(etiqueta, textAlign: TextAlign.center, style: const TextStyle(color: Colors.grey, fontSize: 11, height: 1.2)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOpcionMenu(IconData icono, String titulo, String subtitulo, Color activeColor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 5, offset: const Offset(0, 2))
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: activeColor.withValues(alpha: 0.1),
            child: Icon(icono, color: activeColor),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(titulo, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87)),
                Text(subtitulo, style: const TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
        ],
      ),
    );
  }
}