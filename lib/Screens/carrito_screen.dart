import 'package:flutter/material.dart';

class CarritoScreen extends StatelessWidget {
  const CarritoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Mi Carrito Solidario",
          style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF03A9F4)),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF03A9F4)),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                _buildCartItem("Membresía Guardián", "7 soles", Icons.verified_user),
                _buildCartItem("Donación Alimento", "50 soles", Icons.pets),
              ],
            ),
          ),
          _buildResumenPago(),
        ],
      ),
    );
  }

  Widget _buildCartItem(String nombre, String precio, IconData icono) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FBFD),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE1F5FE), width: 1),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icono, color: const Color(0xFF03A9F4), size: 30),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nombre, 
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 4),
                Text(
                  precio, 
                  style: const TextStyle(
                    color: Color(0xFF03A9F4), 
                    fontWeight: FontWeight.w900,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              // Lógica para eliminar item
            }, 
            icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
          ),
        ],
      ),
    );
  }

  Widget _buildResumenPago() {
    return Container(
      padding: const EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 40),
      decoration: BoxDecoration(
        color: const Color(0xFF03A9F4),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF01579B).withOpacity(0.2),
            blurRadius: 15,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Total a donar:", 
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              Text(
                "57 soles", 
                style: TextStyle(
                  color: Colors.white, 
                  fontSize: 26, 
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ElevatedButton(
              onPressed: () {
                // Lógica de pasarela de pago
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFF03A9F4),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                "PROCEDER AL PAGO", 
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}