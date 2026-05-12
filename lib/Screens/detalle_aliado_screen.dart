import 'package:flutter/material.dart';

class DetalleAliadoScreen extends StatelessWidget {
  final String nombre;
  final String rubro;
  final String beneficio;
  final IconData icono;

  const DetalleAliadoScreen({
    super.key,
    required this.nombre,
    required this.rubro,
    required this.beneficio,
    required this.icono,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(nombre, style: const TextStyle(color: Color(0xFF03A9F4), fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF03A9F4)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // CABECERA VISUAL
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(30),
              color: const Color(0xFFF8FBFD),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundColor: const Color(0xFF03A9F4),
                    child: Icon(icono, color: Colors.white, size: 45),
                  ),
                  const SizedBox(height: 15),
                  Text(nombre, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  Text(rubro, style: const TextStyle(color: Colors.grey, fontSize: 16)),
                ],
              ),
            ),
            // TARJETA DE BENEFICIO
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF03A9F4), Color(0xFF01579B)],
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF01579B).withAlpha(77), // Corrección de withOpacity
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const Icon(Icons.stars, color: Colors.white, size: 35),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Tu beneficio exclusivo:",
                            style: TextStyle(color: Colors.white70, fontSize: 12),
                          ),
                          Text(
                            beneficio,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // BOTÓN DE ACCIÓN WHATSAPP
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ElevatedButton.icon(
                onPressed: () {
                  // Aquí irá la lógica para contactar al aliado
                },
                icon: const Icon(Icons.chat),
                label: const Text(
                  "CONSULTAR POR WHATSAPP",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF25D366), // Color oficial WhatsApp
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 2,
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}