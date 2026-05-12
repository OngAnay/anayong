import 'package:flutter/material.dart';

class GruposInteresScreen extends StatelessWidget {
  const GruposInteresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7F9),
      appBar: AppBar(
        title: const Text("Mis Círculos Añay", 
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: const Color(0xFF01579B),
        elevation: 0,
        actions: [
          IconButton(icon: const Icon(Icons.search, color: Colors.white), onPressed: () {}),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // PREFERENCIAS RÁPIDAS
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text("¿Qué te mueve hoy?", 
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              children: [
                _buildInterestChip("🏃 Runners", true),
                _buildInterestChip("🏊 Nadadores", false),
                _buildInterestChip("🏖️ Playeros", false),
                _buildInterestChip("☕ Cafeteros", false),
                _buildInterestChip("📸 Fotografía", false),
              ],
            ),
          ),

          const SizedBox(height: 25),

          // LISTA DE COMUNIDADES ACTIVAS
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text("Grupos cerca de ti", 
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
          ),
          
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(15),
              children: [
                _buildGroupCard("Añay Runners AQP", "Quedamos mañana 6 AM en la Plaza de Yanahuara.", "24 activos", Icons.directions_run),
                _buildGroupCard("Club de Natación", "Entrenamientos libres en la piscina municipal.", "12 activos", Icons.pool),
                _buildGroupCard("Team Nocturno", "Salidas a caminar por el centro cuando baja el sol.", "45 activos", Icons.dark_mode),
              ],
            ),
          ),

          // EL PEAJE CARISMÁTICO (BOTÓN UN SOL)
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, offset: const Offset(0, -2))],
            ),
            child: SafeArea(
              child: Row(
                children: [
                  const Expanded(
                    child: Text("¿Haciendo planes? Suelta 1 SOL para que un perrito también tenga un buen día. 🐾", 
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pinkAccent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                    ),
                    child: const Text("DONAR S/ 1", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInterestChip(String label, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF03A9F4) : Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: isSelected ? Colors.transparent : Colors.grey.shade300),
      ),
      child: Center(
        child: Text(label, 
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black87, 
            fontWeight: FontWeight.bold,
            fontSize: 13
          )),
      ),
    );
  }

  Widget _buildGroupCard(String title, String desc, String members, IconData icon) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: const Color(0xFFE1F5FE), 
          child: Icon(icon, color: const Color(0xFF01579B))
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(desc, style: const TextStyle(fontSize: 12), maxLines: 2, overflow: TextOverflow.ellipsis),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.people, size: 16, color: Colors.grey),
            Text(members, style: const TextStyle(fontSize: 10, color: Colors.grey)),
          ],
        ),
        onTap: () {},
      ),
    );
  }
}
