import 'package:flutter/material.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;

    return Scaffold(
      backgroundColor: const Color(0xFFF8FBFD),
      appBar: AppBar(
        title: const Text("Mi Perfil Solidario"),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeaderPerfil(),
            Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --- BILLETERA DE LEALTAD & CASHBACK ---
                  Text(
                    "Tu Billetera de Lealtad XL",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: primaryColor),
                  ),
                  const SizedBox(height: 15),
                  _buildMonederoCashback(context),
                  const SizedBox(height: 35),

                  // --- SECCIÓN DE IMPACTO ---
                  const Text(
                    "Mi Impacto Añay",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 20),
                  _buildStatsRow(primaryColor),
                  const SizedBox(height: 35),

                  // --- MENÚ DE OPCIONES ---
                  const Text(
                    "Opciones",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 15),
                  _buildOpcionMenu(Icons.person_outline, "Mis Datos", "Edita tu información personal", primaryColor),
                  _buildOpcionMenu(Icons.favorite_border, "Mis Adopciones", "Mira tus procesos actuales", primaryColor),
                  _buildOpcionMenu(Icons.history, "Historial de Consumos", "Validaciones de Don Bajón XL, Yape y Plin", primaryColor),
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
      padding: const EdgeInsets.only(top: 30, bottom: 30),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
      ),
      child: const Column(
        children: [
          CircleAvatar(
            radius: 50, 
            backgroundColor: Colors.lightBlueAccent,
            child: Icon(Icons.person, size: 55, color: Colors.white),
          ),
          SizedBox(height: 15),
          Text("Brendon Beltrán", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Text("Socio Benefactor Añay", style: TextStyle(color: Colors.grey, fontSize: 14)),
        ],
      ),
    );
  }

  // WIDGET CORREGIDO: SE CAMBIÓ CARD POR CONTAINER PARA SOPORTAR GRADIENT
  Widget _buildMonederoCashback(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.lightBlue, Colors.purpleAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Dinero Canjeable / Cashback", style: TextStyle(color: Colors.white70, fontSize: 13, fontWeight: FontWeight.w500)),
                Icon(Icons.wallet, color: Colors.white70, size: 20),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              "2000 soles", 
              style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Flujo futuro para cargar el screenshot de Yape/Plin
                    },
                    icon: const Icon(Icons.qr_code_scanner, size: 16),
                    label: const Text("Validar Yape / Plin", style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.lightBlue,
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.volunteer_activism, size: 16, color: Colors.white),
                    label: const Text("Donar Cashback", style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.white)),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.white, width: 1.5),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildStatsRow(Color activeColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildStatCard("🐾 12", "Huellitas\nApoyadas"),
        _buildStatCard("🍗 45 kg", "Alimento\nDonado"),
        _buildStatCard("🔥 XL", "Nivel de\nSocio"),
      ],
    );
  }

  Widget _buildStatCard(String valor, String etiqueta) {
    return Expanded(
      child: Card(
        color: Colors.white,
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          child: Column(
            children: [
              Text(valor, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.lightBlue)),
              const SizedBox(height: 4),
              Text(etiqueta, textAlign: TextAlign.center, style: const TextStyle(color: Colors.grey, fontSize: 11, height: 1.2)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOpcionMenu(IconData icono, String titulo, String subtitulo, Color activeColor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 5, offset: const Offset(0, 2))
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: activeColor.withValues(alpha: 0.1),
            child: Icon(icono, color: activeColor),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(titulo, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87)),
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