import 'package:flutter/material.dart';
import 'package:ong_anay/Models/aliado_model.dart';
import 'package:ong_anay/Widgets/aliado_card.dart';

class MarketAliadosScreen extends StatelessWidget {
  const MarketAliadosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Datos de prueba: Empresas aliadas de Añay en Arequipa
    final listaAliados = [
      Aliado(
        id: '1',
        nombre: 'Veterinaria San Francisco',
        rubro: 'Salud y Medicina',
        beneficio: '15% de dscto en Consultas',
        imagenUrl: 'https://images.unsplash.com/photo-1584132967334-10e028bd69f7?auto=format&fit=crop&q=80',
        icono: Icons.local_hospital,
      ),
      Aliado(
        id: '2',
        nombre: 'Pet Shop Huellitas Felices',
        rubro: 'Alimentos y Juguetes',
        beneficio: 'Envíos gratis + 10% en Accesorios',
        imagenUrl: 'https://images.unsplash.com/photo-1516734212186-a967f81ad0d7?auto=format&fit=crop&q=80',
        icono: Icons.shopping_bag,
      ),
      Aliado(
        id: '3',
        nombre: 'Grooming Canino Misti',
        rubro: 'Estética y Baño',
        beneficio: '3x2 en Baños Medicados',
        imagenUrl: 'https://images.unsplash.com/photo-1516734212186-a967f81ad0d7?auto=format&fit=crop&q=80', // Puedes cambiar por foto de spa canino
        icono: Icons.content_cut,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Beneficios Aliados',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.grey[50],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Introducción explicativa
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF008080).withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFF008080).withValues(alpha: 0.2)),
              ),
              child: const Row(
                children: [
                  Icon(Icons.stars, color: Color(0xFFFF7F50), size: 30),
                   SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Por ser miembro de Añay, estas empresas comprometidas con el bienestar animal te ofrecen beneficios exclusivos.',
                      style: TextStyle(fontSize: 13, height: 1.4, color: Colors.black87),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              'Establecimientos Disponibles',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF008080)),
            ),
          ),
          
          // Lista de Aliados
          Expanded(
            child: ListView.builder(
              itemCount: listaAliados.length,
              itemBuilder: (context, index) {
                return AliadoCard(
                  aliado: listaAliados[index],
                  onTap: () {
                    // Navega a la pantalla de detalle registrada en main.dart
                    Navigator.pushNamed(context, '/detalle_aliado');
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}