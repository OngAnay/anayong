import 'package:flutter/material.dart';
import 'home_screen.dart'; // Tu pantalla nueva del carrusel
import 'catalogo_merch_screen.dart'; // Tu pantalla de catálogo (asegúrate que el nombre sea correcto)

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  // Lista de las pantallas principales
  final List<Widget> _screens = [
    const HomeScreen(),      // Índice 0: El menú con carrusel y publicidad
    const CatalogoMerchScreen(),  // Índice 1: La tienda/market
    const Center(child: Text("Pantalla de Albergues")), // Índice 2: Temporal
    const Center(child: Text("Perfil")),               // Índice 3: Temporal
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.purple[800], // Color unificado
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: 'Tienda'),
          BottomNavigationBarItem(icon: Icon(Icons.pets), label: 'Albergues'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }
}