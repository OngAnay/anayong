import 'package:flutter/material.dart';
import 'package:ong_anay/Screens/albergue_model.dart'; // RUTA CORREGIDA AQUÍ

class AlbergueCard extends StatelessWidget {
  final Albergue albergue; // Recibe el modelo de Añay

  const AlbergueCard({
    super.key,
    required this.albergue,
  });

  @override
  Widget build(BuildContext context) {
    // Calculamos el progreso de la donación en soles de forma segura
    double progresoDonacion = 0.0;
    if (albergue.metaDonacion > 0) {
      progresoDonacion = albergue.recaudado / albergue.metaDonacion;
      if (progresoDonacion > 1.0) progresoDonacion = 1.0; 
    }

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Imagen del Albergue
          Container(
            height: 150,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
              image: albergue.imagenUrl.isNotEmpty
                  ? DecorationImage(
                      image: NetworkImage(albergue.imagenUrl),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: albergue.imagenUrl.isEmpty
                ? const Center(
                    child: Icon(Icons.image, size: 50, color: Colors.white),
                  )
                : null,
          ),
          
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 2. Nombre del Albergue
                Text(
                  albergue.nombre,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                
                // 3. Ubicación y Cantidad de Perritos
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.location_on, size: 16, color: Colors.grey[600]),
                        const SizedBox(width: 4),
                        Text(albergue.ubicacion, style: TextStyle(color: Colors.grey[600])),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.pets, size: 16, color: Colors.orange[400]),
                        const SizedBox(width: 4),
                        Text(
                          '${albergue.cantidadPerros} perritos', 
                          style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                
                // 4. Metas de Donación en soles
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Meta: ${albergue.metaDonacion.toInt()} soles', 
                      style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
                    ),
                    Text(
                      'Recaudado: ${albergue.recaudado.toInt()} soles', 
                      style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                
                // 5. Barra de progreso visual
                LinearProgressIndicator(
                  value: progresoDonacion, 
                  backgroundColor: Colors.grey[200],
                  color: Colors.orange, 
                  minHeight: 8,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}