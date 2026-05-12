import 'package:flutter/material.dart';

class LogisticaDonacionesScreen extends StatelessWidget {
  const LogisticaDonacionesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logística de Donaciones'),
        backgroundColor: const Color(0xFF008080), // Verde Calma
      ),
      body: Stack(
        children: [
          // Fondo decorativo (pueden cambiarlo por una imagen luego)
          Container(
            color: Colors.grey[100],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '¿Cómo deseas ayudar?',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                _buildDonationOption(
                  icon: Icons.favorite,
                  title: 'Donación Económica',
                  subtitle: 'Yape, Plin o Transferencia',
                  color: const Color(0xFFFF7F50), // Coral
                ),
                const SizedBox(height: 15),
                _buildDonationOption(
                  icon: Icons.local_shipping,
                  title: 'Donación de Insumos',
                  subtitle: 'Comida, medicinas o mantas',
                  color: const Color(0xFF008080), // Verde Calma
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Aquí irá la lógica para confirmar
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF008080),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: const Text('CONFIRMAR LOGÍSTICA', 
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDonationOption({required IconData icon, required String title, required String subtitle, required Color color}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}