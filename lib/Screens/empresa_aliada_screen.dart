import 'package:flutter/material.dart';

class EmpresaAliadaScreen extends StatelessWidget {
  const EmpresaAliadaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Alianzas Corporativas",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color(0xFF01579B),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Icon(Icons.business, size: 80, color: Color(0xFF01579B)),
            ),
            const SizedBox(height: 20),
            const Text(
              "¿Eres una empresa con propósito?",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            const Text(
              "Súmate a la red Añay y transforma la vida de cientos de perritos en Arequipa mientras fortaleces tu responsabilidad social.",
              style: TextStyle(fontSize: 16, color: Colors.black87, height: 1.4),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            _buildOptionCard(
              "Quiero ser Empresa Aliada",
              "Ofrece beneficios a nuestros socios y atrae a una comunidad fiel.",
              Icons.handshake,
            ),
            _buildOptionCard(
              "Donación Corporativa / Patrocinio",
              "Apoya con recursos o financiamiento para proyectos específicos.",
              Icons.volunteer_activism,
            ),
            _buildOptionCard(
              "Responsabilidad Social",
              "Organiza voluntariados o eventos conjuntos con tu equipo.",
              Icons.groups,
            ),

            const SizedBox(height: 30),
            const Text(
              "Déjanos tus datos y Johncito se contactará contigo:",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            ),
            const SizedBox(height: 15),

            const TextField(
              decoration: InputDecoration(
                labelText: "Nombre de la Empresa",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.apartment),
              ),
            ),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                labelText: "RUC (Opcional)",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.description),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                labelText: "Teléfono de contacto",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.phone),
              ),
              keyboardType: TextInputType.phone,
            ),

            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  // Lógica para enviar datos
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF01579B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  "SOLICITAR INFORMACIÓN",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 20), // Espacio extra al final para el scroll
          ],
        ),
      ),
    );
  }

  Widget _buildOptionCard(String title, String desc, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF03A9F4), size: 35),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                const SizedBox(height: 4),
                Text(
                  desc,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}