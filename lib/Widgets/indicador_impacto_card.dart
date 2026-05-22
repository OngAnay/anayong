import 'package:flutter/material.dart';
import '../Models/impacto_model.dart';

class IndicadorImpactoCard extends StatelessWidget {
  final IndicadorImpacto indicador;

  const IndicadorImpactoCard({super.key, required this.indicador});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Icono destacado en un círculo
            CircleAvatar(
              backgroundColor: indicador.colorTema.withValues(alpha: 0.1),
              radius: 28,
              child: Icon(indicador.icono, color: indicador.colorTema, size: 28),
            ),
            const SizedBox(width: 16),
            
            // Textos del impacto
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    indicador.titulo,
                    style: TextStyle(
                      fontSize: 14, 
                      fontWeight: FontWeight.bold, 
                      color: Colors.grey[600]
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    indicador.cantidadLograda,
                    style: TextStyle(
                      fontSize: 26, 
                      fontWeight: FontWeight.bold, 
                      color: indicador.colorTema
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    indicador.descripcion,
                    style: const TextStyle(fontSize: 13, color: Colors.black87),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}