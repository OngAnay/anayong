import 'package:flutter/material.dart';

class HistoriaScreen extends StatelessWidget {
  const HistoriaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Nuestra Historia",
          style: TextStyle(color: Color(0xFF03A9F4), fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF03A9F4)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // REPRODUCTOR DE VIDEO (Placeholder)
            Container(
              width: double.infinity,
              height: 250,
              decoration: const BoxDecoration(
                color: Colors.black,
                // Puedes añadir una imagen de fondo aquí más adelante
              ),
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.play_circle_fill, size: 80, color: Colors.white70),
                    SizedBox(height: 10),
                    Text(
                      "REPRODUCIR HISTORIA (3 min)",
                      style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "El sueño de Añay",
                    style: TextStyle(
                      fontSize: 24, 
                      fontWeight: FontWeight.bold, 
                      color: Color(0xFF01579B),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Nacimos con una misión clara: que ningún perrito en Arequipa sufra en las calles. Añay no es solo una aplicación, es una comunidad de héroes.",
                    style: TextStyle(
                      fontSize: 16, 
                      height: 1.5, 
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 25),
                  
                  // FRASE DE IMPACTO
                  Container(
                    width: double.infinity, // Para que ocupe todo el ancho
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE1F5FE),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Text(
                      "\"Tu pequeña acción hoy, es el futuro de una huellita mañana.\"",
                      style: TextStyle(
                        fontStyle: FontStyle.italic, 
                        color: Color(0xFF0288D1), 
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  
                  const SizedBox(height: 30),
                  
                  // BOTÓN PARA UNIRSE
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        // Acción para unirse o navegar
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF03A9F4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 2,
                      ),
                      child: const Text(
                        "QUIERO SER PARTE DEL CAMBIO", 
                        style: TextStyle(
                          color: Colors.white, 
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20), // Margen inferior extra
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}