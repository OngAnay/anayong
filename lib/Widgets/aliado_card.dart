import 'package:flutter/material.dart';
import 'package:ong_anay/Models/aliado_model.dart';

class AliadoCard extends StatelessWidget {
  final Aliado aliado;
  final VoidCallback onTap;

  const AliadoCard({super.key, required this.aliado, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              // Imagen o Logo del Aliado
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  aliado.imagenUrl,
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              
              // Información del Aliado
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(aliado.icono, size: 18, color: const Color(0xFF008080)),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            aliado.nombre,
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      aliado.rubro,
                      style: TextStyle(color: Colors.grey[600], fontSize: 13),
                    ),
                    const SizedBox(height: 8),
                    
                    // Contenedor destacado para el beneficio/descuento
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF7F50).withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        aliado.beneficio,
                        style: const TextStyle(
                          color: Color(0xFFFF7F50), // Coral Vivo
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              // Flecha indicadora para ir al detalle
              const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}