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
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xFF01579B)),
                  ),
                  const SizedBox(height: 20),
                  _buildStatsRow(),
                  const SizedBox(height: 35),
                  const Text(
                    "Mis Medallas",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xFF01579B)),
                  ),
                  const SizedBox(height: 20),
                  _buildMedallasRow(),
                  const SizedBox(height: 35),
                  _buildOpcionMenu(Icons.favorite, "Mis Apadrinados", "3 perritos"),
                  _buildOpcionMenu(Icons.history, "Historial de Donaciones", "Ver todo"),
                  _buildOpcionMenu(Icons.settings, "Configuración", "Cuenta y pagos"),
                  const SizedBox(height: 20),
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
      width: double.infinity,
      padding: const EdgeInsets.only(top: 70, bottom: 40),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF03A9F4), Color(0xFF01579B)],
        ),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(45)),
      ),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 55,
            backgroundColor: Colors.white,
            child: Icon(Icons.person, size: 65, color: Color(0xFF03A9F4)),
          ),
          const SizedBox(height: 15),
          const Text(
            "Brendon Beltrán",
            style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(50),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.white30),
            ),
            child: const Text(
              "Guardián de Oro",
              style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsRow() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(color: Colors.black.withAlpha(10), blurRadius: 15, offset: const Offset(0, 5))
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildStatItem("Vidas Salvadas", "12"),
          _buildStatItem("Días como Socio", "150"),
          _buildStatItem("Donado", "450 soles"),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String valor) {
    return Column(
      children: [
        Text(
          valor, 
          style: const TextStyle(color: Color(0xFF03A9F4), fontWeight: FontWeight.w900, fontSize: 17),
        ),
        const SizedBox(height: 4),
        Text(
          label, 
          style: const TextStyle(color: Colors.grey, fontSize: 11, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _buildMedallasRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildMedalla(Icons.verified, "Fiel"),
        _buildMedalla(Icons.volunteer_activism, "Socio"),
        _buildMedalla(Icons.auto_awesome, "Top"),
      ],
    );
  }

  Widget _buildMedalla(IconData icono, String nombre) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
            color: Color(0xFFE1F5FE),
            shape: BoxShape.circle,
          ),
          child: Icon(icono, color: const Color(0xFF0288D1), size: 30),
        ),
        const SizedBox(height: 8),
        Text(
          nombre, 
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black54),
        ),
      ],
    );
  }

  Widget _buildOpcionMenu(IconData icono, String titulo, String subtitulo) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(color: Colors.black.withAlpha(5), blurRadius: 10, offset: const Offset(0, 2))
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFF0F9FF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icono, color: const Color(0xFF03A9F4)),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(titulo, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                const SizedBox(height: 2),
                Text(subtitulo, style: const TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),  Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
        ],
      ),
    );
  }
}