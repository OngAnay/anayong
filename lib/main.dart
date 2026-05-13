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
      // La ruta inicial es el Login
      initialRoute: '/', //
      
      // Registro de todas las pantallas de la ONG Añay
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
        '/perfil_albergue': (context) => const PerfilAlbergueScreen(),
        '/reportar_perdido': (context) => const ReportarPerdidoScreen(),
      },
    );
  }
}