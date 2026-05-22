import 'package:flutter/material.dart';
import '../Models/impacto_model.dart';
import '../Widgets/indicador_impacto_card.dart';

class RutaImpactoScreen extends StatelessWidget {
  const RutaImpactoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Datos de prueba con los logros de Añay
    final listaImpacto = [
      IndicadorImpacto(
        id: '1',
        titulo: 'VIDAS SALVADAS',
        cantidadLograda: '142',
        descripcion: 'Perritos rescatados de las calles y Chiguata en lo que va del año.',
        icono: Icons.pets,
        colorTema: const Color(0xFF008080), // Teal de Añay
      ),
      IndicadorImpacto(
        id: '2',
        titulo: 'ALIMENTACIÓN',
        cantidadLograda: '3.2 Ton',
        descripcion: 'De comida balanceada distribuida a los albergues aliados.',
        icono: Icons.restaurant,
        colorTema: const Color(0xFFFF7F50), // Coral de Añay
      ),
      IndicadorImpacto(
        id: '3',
        titulo: 'SALUD ANIMAL',
        cantidadLograda: '85',
        descripcion: 'Campañas de esterilización y atención médica gratuita realizadas.',
        icono: Icons.favorite,
        colorTema: Colors.red[400]!,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ruta del Impacto',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.grey[50],
      body: Column(
        children: [
          // Mensaje superior inspirador
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Gracias a tus donaciones y compras en el catálogo, estamos transformando el bienestar animal en Arequipa. ¡Mira lo que hemos logrado juntos!',
              style: TextStyle(fontSize: 14, color: Colors.grey[700], height: 1.4),
              textAlign: TextAlign.center,
            ),
          ),
          
          // Lista de indicadores de logros
          Expanded(
            child: ListView.builder(
              itemCount: listaImpacto.length,
              itemBuilder: (context, index) {
                return IndicadorImpactoCard(indicador: listaImpacto[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}