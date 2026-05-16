import 'package:flutter/material.dart';
import 'package:ong_anay/Models/mascota_model.dart'; // Importa el modelo que acabamos de crear

class MascotaCard extends StatelessWidget {
  final Mascota mascota;

  const MascotaCard({super.key, required this.mascota});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 3,
      child: Row(
        children: [
          // Imagen del perrito
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
            child: Image.network(
              mascota.imagenUrl,
              height: 120,
              width: 120,
              fit: BoxFit.cover,
            ),
          ),
          
          // Información del perrito
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        mascota.nombre,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        mascota.sexo == 'Macho' ? Icons.male : Icons.female,
                        color: mascota.sexo == 'Macho' ? Colors.blue : Colors.pink,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    mascota.raza,
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                  const SizedBox(height: 8),
                  
                  // Etiquetas de edad y tamaño
                  Row(
                    children: [
                      _buildBadge(mascota.edad, Colors.teal[50]!, Colors.teal[700]!),
                      const SizedBox(width: 6),
                      _buildBadge(mascota.tamano, Colors.orange[50]!, Colors.orange[700]!),
                    ],
                  ),
                  const SizedBox(height: 8),
                  
                  // Ubicación
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        mascota.ubicacion,
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Molde rápido para las etiquetas de texto (Badges)
  Widget _buildBadge(String text, Color bgColor, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: TextStyle(color: textColor, fontSize: 12, fontWeight: FontWeight.bold),
      ),
    );
  }
}