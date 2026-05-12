import 'package:flutter/material.dart';
import 'package:ong_anay/Screens/login_screen.dart';
import 'package:ong_anay/Screens/adopciones_screen.dart';
import 'package:ong_anay/Screens/perfil_screen.dart';
import 'package:ong_anay/Screens/detalle_aliado_screen.dart';
import 'package:ong_anay/Screens/carrito_screen.dart';
import 'package:ong_anay/Screens/ruta_impacto_screen.dart';
import 'package:ong_anay/Screens/catalogo_merch_screen.dart';

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
        primaryColor: const Color(0xFF01579B),
      ),
      // Definimos la pantalla de inicio
      initialRoute: '/',
      // Registramos todas las pantallas para que el APK las reconozca
      routes: {
        '/': (context) => const LoginScreen(),
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
      },
    );
  }
}