import 'package:flutter/material.dart';
import 'package:ong_anay/Models/producto_model.dart';

class ProductoCard extends StatelessWidget {
  final ProductoMerch producto;
  final VoidCallback onAdd; // Para la función de agregar al carrito

  const ProductoCard({super.key, required this.producto, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagen del producto con botón de favorito
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                  child: Image.network(
                    producto.imagenUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: CircleAvatar(
                    backgroundColor: Colors.white.withValues(alpha: 0.8),
                    radius: 15,
                    child: const Icon(Icons.favorite_border, size: 18, color: Colors.red),
                  ),
                ),
              ],
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  producto.nombre,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  'S/ ${producto.precio.toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: Color(0xFF008080), 
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                  ),
                ),
                const SizedBox(height: 8),
                
                // Botón Añadir al Carrito
                SizedBox(
                  width: double.infinity,
                  height: 35,
                  child: ElevatedButton(
                    onPressed: onAdd,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF7F50), // Coral Vivo
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      padding: EdgeInsets.zero,
                    ),
                    child: const Text(
                      "AÑADIR", 
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}