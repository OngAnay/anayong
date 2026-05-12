import 'package:flutter/material.dart';

class ReportarPerdidoScreen extends StatelessWidget {
  const ReportarPerdidoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Reportar Perrito",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.redAccent, // Color de emergencia
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "¿Viste un perrito en peligro o perdido?",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "Tu reporte le llegará a todos los usuarios cercanos en Arequipa.",
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 30),

            // BOTÓN PARA SUBIR FOTO
            GestureDetector(
              onTap: () {
                // Aquí se activará la cámara con Johncito más adelante
              },
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.redAccent.withValues(alpha: 0.3), 
                    width: 2,
                  ),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.camera_alt, size: 50, color: Colors.redAccent),
                    SizedBox(height: 10),
                    Text(
                      "TOMAR FOTO", 
                      style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            // CAMPO DE UBICACIÓN
            const TextField(
              decoration: InputDecoration(
                labelText: "Donde lo viste (Ej: Parque Selva Alegre)",
                hintText: "Escribe la referencia de la zona",
                prefixIcon: Icon(Icons.location_on, color: Colors.redAccent),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            // DESCRIPCIÓN RÁPIDA
            const TextField(
              maxLines: 3,
              decoration: InputDecoration(
                labelText: "Descripción rápida (Ej: Cojea de una pata, collar azul)",
                alignLabelWithHint: true, // Alinea el label arriba cuando hay varias líneas
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 30),

            // BOTÓN DE DIFUSIÓN MÁXIMA
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  // Aquí se activa la magia del código para enviar notificaciones
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 4, // Más elevación para que destaque
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.campaign, color: Colors.white),
                    SizedBox(width: 10),
                    Text(
                      "DIFUNDIR ALERTA AHORA", 
                      style: TextStyle(
                        color: Colors.white, 
                        fontWeight: FontWeight.bold, 
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}