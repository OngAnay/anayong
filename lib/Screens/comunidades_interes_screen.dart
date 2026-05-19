import 'package:flutter/material.dart';

class ComunidadesInteresScreen extends StatelessWidget {
  const ComunidadesInteresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista real de albergues para Añay en Arequipa
    final List<Map<String, String>> albergues = [
      {"nombre": "Albergue Huellitas Chiguata", "ubicacion": "Chiguata, Arequipa", "perros": "45 perritos"},
      {"nombre": "Refugio Patitas Felices", "ubicacion": "Cayma, Arequipa", "perros": "30 de la calle"},
      {"nombre": "Asociación Amor Animal", "ubicacion": "Cerro Colorado, Arequipa", "perros": "60 huellitas"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Albergues Afiliados"),
        backgroundColor: Colors.purple,
      ),
      body: ListView.builder(
        itemCount: albergues.length,
        itemBuilder: (context, index) {
          final albergue = albergues[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 4,
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: const CircleAvatar(
                backgroundColor: Colors.purple,
                radius: 25,
                child: Icon(Icons.pets, color: Colors.white),
              ),
              title: Text(
                albergue["nombre"]!,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 5),
                  Text("📍 ${albergue["ubicacion"]!}"),
                  Text("🐶 Población: ${albergue["perros"]!}"),
                ],
              ),
              trailing: const Icon(Icons.arrow_forward_ios, color: Colors.purple, size: 18),
              onTap: () {
                // Te llevará al perfil detallado del albergue seleccionado
                Navigator.pushNamed(context, '/perfil_albergue');
              },
            ),
          );
        },
      ),
    );
  }
}