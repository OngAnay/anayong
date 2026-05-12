import 'package:flutter/material.dart';

class AdopcionesScreen extends StatelessWidget {
  const AdopcionesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FBFD),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text("Albergues Aliados", style: TextStyle(color: Color(0xFF03A9F4), fontSize: 24, fontWeight: FontWeight.w900)),
          const SizedBox(height: 10),
          const Text("Conoce y apoya los hogares de nuestros peluditos en Arequipa.", style: TextStyle(color: Colors.grey, fontSize: 14)),
          const SizedBox(height: 25),
          _buildAlbergueCard(context, "Albergue Chiguata", "Chiguata, Arequipa", "45 perros", 0.7, "700 / 1000 soles", const Color(0xFF03A9F4)),
          const SizedBox(height: 20),
          _buildAlbergueCard(context, "Refugio San Francisco", "Characato, Arequipa", "30 perros", 0.3, "300 / 1000 soles", const Color(0xFF4FC3F7)),
        ],
      ),
    );
  }

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
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(color: color.withAlpha(25), borderRadius: const BorderRadius.vertical(top: Radius.circular(25))),
            child: Icon(Icons.pets, size: 50, color: color),
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
                Row(
                  children: [
                    Icon(Icons.group, size: 16, color: color),
                    const SizedBox(width: 5),
                    Text("Población: $cantidad", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                  ],
                ),
                const SizedBox(height: 10),
                LinearProgressIndicator(value: progreso, backgroundColor: Colors.grey.shade200, color: color, minHeight: 8, borderRadius: BorderRadius.circular(10)),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Meta de este mes:", style: TextStyle(fontSize: 11, color: Colors.grey)),
                    Text(metaTxt, style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: color)),
                  ],
                ),
                const SizedBox(height: 20),
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
}