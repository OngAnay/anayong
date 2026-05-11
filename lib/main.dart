import 'package:flutter/material.dart';

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
        useMaterial3: true,
      ),
      home: const MainSkeleton(),
    );
  }
}

class MainSkeleton extends StatefulWidget {
  const MainSkeleton({super.key});

  @override
  State<MainSkeleton> createState() => _MainSkeletonState();
}

class _MainSkeletonState extends State<MainSkeleton> {
  int _selectedIndex = 0;
  String _ciudadSeleccionada = "Arequipa";

  // Se agregó <String> para que el Dropdown no de error
  final List<String> _ciudades = [
    "Arequipa", "Lima", "Cusco", "Trujillo", "Piura", "Puno", "Tacna", "Juliaca", "Moquegua"
  ];

  static const List<Widget> _paginas = [
    Center(child: Text('Foro de Eventos y Chisme 24h', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
    Center(child: Text('Radar Anay: Gente Activa', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
    Center(child: Text('Mis Donaciones y Albergues', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
    Center(child: Text('Mi Perfil', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF01579B),
        elevation: 0,
        centerTitle: false,
        title: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: _ciudadSeleccionada,
            dropdownColor: const Color(0xFF01579B),
            icon: const Icon(Icons.location_on, color: Colors.white),
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
            onChanged: (String? newValue) {
              setState(() {
                _ciudadSeleccionada = newValue!;
              });
            },
            // Corrección en la sintaxis del .map
            items: _ciudades.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: _paginas[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF01579B),
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.forum_outlined),
            activeIcon: Icon(Icons.forum),
            label: 'Comunidad',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.radar_outlined),
            activeIcon: Icon(Icons.radar),
            label: 'Radar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pets_outlined),
            activeIcon: Icon(Icons.pets),
            label: 'Huellitas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}