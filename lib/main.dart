import 'package:flutter/material.dart';
import 'package:ong_anay/Screens/login_screen.dart';
import 'package:ong_anay/Screens/adopciones_screen.dart';
import 'package:ong_anay/Screens/perfil_screen.dart';
import 'package:ong_anay/Screens/detalle_aliado_screen.dart';
import 'package:ong_anay/Screens/carrito_screen.dart';
import 'package:ong_anay/Screens/ruta_impacto_screen.dart';
import 'package:ong_anay/Screens/catalogo_merch_screen.dart';
import 'package:ong_anay/Screens/home_screen.dart';
import 'package:ong_anay/Screens/comunidades_interes_screen.dart';
import 'package:ong_anay/Screens/empresa_aliada_screen.dart';
import 'package:ong_anay/Screens/feet_videos_screen.dart';
import 'package:ong_anay/Screens/historia_screen.dart';
import 'package:ong_anay/Screens/logistica_donaciones_screen.dart';
import 'package:ong_anay/Screens/market_aliados_screen.dart';
import 'package:ong_anay/Screens/perfil_albergue_screen.dart';
import 'package:ong_anay/Screens/reportar_perdido_screen.dart';
import 'package:ong_anay/Screens/main_page.dart';
import 'package:ong_anay/Screens/albergue_model.dart'; 

void main() {
  runApp(const AnayApp());
}

class AnayApp extends StatelessWidget {
  const AnayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Anay - El Refugio Perfecto',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: const Color(0xFF01579B),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF01579B)),
      ),
      initialRoute: '/', 
      
      routes: {
        '/': (context) => const LoginScreen(),
        '/main_page': (context) => const MainPage(),
        '/home': (context) => const HomeScreen(),
        '/adopciones': (context) => const AdopcionesScreen(),
        '/perfil': (context) => const PerfilScreen(),
        '/carrito': (context) => const CarritoScreen(),
        '/ruta_impacto': (context) => const RutaImpactoScreen(),
        '/catalogo': (context) => const CatalogoMerchScreen(),
        '/detalle_aliado': (context) => const DetalleAliadoScreen(
              nombre: "Socio Aliado",
              rubro: "Bienestar Animal",
              beneficio: "Descuento Exclusivo",
              icono: Icons.pets,
            ),
        '/comunidades': (context) => const ComunidadesInteresScreen(),
        '/empresa_aliada': (context) => const EmpresaAliadaScreen(),
        '/feet_videos': (context) => const FeetVideosScreen(),
        '/historia': (context) => const HistoriaScreen(),
        '/logistica': (context) => const LogisticaDonacionesScreen(),
        '/market_aliados': (context) => const MarketAliadosScreen(),
        
        '/perfil_albergue': (context) => PerfilAlbergueScreen(
              albergue: Albergue(
                nombre: 'Albergue Patitas Arequipa',
                ubicacion: 'Distrito de Chiguata, Arequipa',
                resena: 'Este albergue ubicado en las faldas del Misti se dedica al rescate y rehabilitación de animales en abandono extremo. Nuestra misión con la ONG Añay es darles una vida digna.', // Cambiado aquí
                imagenUrl: 'https://images.unsplash.com/photo-1548199973-03cce0bbc87b?auto=format&fit=crop&q=80',
                cantidadPerros: 45,
                metaDonacion: 2000.0,
                recaudado: 1200.0,
              ),
            ),
            
        '/reportar_perdido': (context) => const ReportarPerdidoScreen(),
      },
    );
  }
}