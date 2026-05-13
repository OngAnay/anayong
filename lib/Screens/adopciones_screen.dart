import 'package:flutter/material.dart';

class AdopcionesScreen extends StatelessWidget {
  const AdopcionesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FBFD),
      appBar: AppBar(
        title: const Text("Adopciones y Albergues"),
        backgroundColor: Colors.purple, // Color unificado con tu Home
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text("Albergues Aliados", 
            style: TextStyle(color: Colors.purple, fontSize: 24, fontWeight: FontWeight.w900)),
          const SizedBox(height: 10),
          const Text("Conoce y apoya los hogares de nuestros peluditos en Arequipa.", 
            style: TextStyle(color: Colors.grey, fontSize: 14)),
          const SizedBox(height: 25),
          
          // Tus Albergues con los datos que me pasaste
          _buildAlbergueCard(context, "Albergue Chiguata", "Chiguata, Arequipa", "45 perros", 0.7, "700 / 1000 soles", Colors.purple),
          const SizedBox(height: 30),

          // --- NUEVA SECCIÓN VISUAL DE PERRITOS ---
          const Text("Perritos listos para un hogar", 
            style: TextStyle(color: Colors.purple, fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 15),

          _buildPetCard(
            context,
            "Firulais",
            "2 años",
            "Cachorro juguetón rescatado en Chiguata.",
            "https://images.unsplash.com/photo-1543466835-00a7907e9de1?auto=format&fit=crop&q=80&w=400",
          ),
          _buildPetCard(
            context,
            "Luna",
            "4 años",
            "Tranquila y educada, busca una familia amorosa.",
            "https://images.unsplash.com/photo-1537151608828-ea2b11777ee8?auto=format&fit=crop&q=80&w=400",
          ),
          
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // Tu widget original de Albergues mejorado
  Widget _buildAlbergueCard(BuildContext context, String nombre, String lugar, String cantidad, double progreso, String metaTxt, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [BoxShadow(color: Colors.black.withAlpha(12), blurRadius: 10)],
      ),
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(color: color.withAlpha(25), borderRadius: const BorderRadius.vertical(top: Radius.circular(25))),
            child: Icon(Icons.home_work, size: 50, color: color),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(nombre, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    Icon(Icons.location_on, color: color, size: 18),
                  ],
                ),
                Text(lugar, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                const SizedBox(height: 15),
                LinearProgressIndicator(value: progreso, backgroundColor: Colors.grey.shade200, color: color, minHeight: 8, borderRadius: BorderRadius.circular(10)),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Meta de este mes:", style: TextStyle(fontSize: 11, color: Colors.grey)),
                    Text(metaTxt, style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: color)),
                  ],
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(backgroundColor: color, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                    child: const Text("APOYAR ALBERGUE", style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --- NUEVO WIDGET VISUAL PARA PERRITOS ---
  Widget _buildPetCard(BuildContext context, String nombre, String edad, String descripcion, String imageUrl) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.network(
              imageUrl,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 180, color: Colors.grey[300], child: const Icon(Icons.pets, size: 50, color: Colors.grey)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(nombre, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    Text(edad, style: const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 5),
                Text(descripcion, style: const TextStyle(color: Colors.grey, fontSize: 13)),
                const SizedBox(height: 15),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.purple),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Center(child: Text("CONOCER MÁS", style: TextStyle(color: Colors.purple))),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}