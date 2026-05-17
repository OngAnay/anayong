import 'package:flutter/material.dart';

class MenuBotonWidget extends StatelessWidget {
  final String titulo;
  final IconData icono;
  final Color colorIcono;
  final String ruta;

  const MenuBotonWidget({
    super.key,
    required this.titulo,
    required this.icono,
    required this.colorIcono,
    required this.ruta,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: () {
          // Navega automáticamente usando las rutas que registramos en main.dart
          Navigator.pushNamed(context, ruta);
        },
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 26,
                backgroundColor: colorIcono.withValues(alpha: 0.1),
                child: Icon(icono, color: colorIcono, size: 28),
              ),
              const SizedBox(height: 12),
              Text(
                titulo,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}