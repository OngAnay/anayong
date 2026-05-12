import 'package:flutter/material.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FBFD),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeaderPerfil(),
            Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Mi Impacto Añay",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 20),
                  _buildStatsRow(),
                  const SizedBox(height: 35),
                  const Text(
                    "Opciones",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 15),
                  _buildOpcionMenu(Icons.person_outline, "Mis Datos", "Edita tu información personal"),
                  _buildOpcionMenu(Icons.favorite_border, "Mis Adopciones", "Mira tus procesos actuales"),
                  _buildOpcionMenu(Icons.history, "Historial", "Donaciones y actividades"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderPerfil() {
    return Container(
      padding: const EdgeInsets.only(top: 60, bottom: 30),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
      ),
      child: const Column(
        children: [
          CircleAvatar(radius: 50, backgroundColor: Colors.grey),
          SizedBox(height: 15),
          Text("Brendon Beltrán", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildStatsRow() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Stats placeholder"), // Aquí puedes poner tus widgets de impacto
      ],
    );
  }

  Widget _buildOpcionMenu(IconData icono, String titulo, String subtitulo) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Icon(icono, color: Colors.blue),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(titulo, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(subtitulo, style: const TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
        ],
      ),
    );
  }
}