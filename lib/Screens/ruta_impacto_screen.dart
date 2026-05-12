import 'package:flutter/material.dart';

class RutaImpactoScreen extends StatelessWidget {
  const RutaImpactoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Mi Ruta de Impacto",
          style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF03A9F4)),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF03A9F4)),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
        children: [
          _buildMilestone(
            "¡Bienvenido Guardián!",
            "Te uniste a la familia Añay.",
            Icons.stars,
            true, // Completado
            true, // Mostrar línea hacia abajo
          ),
          _buildMilestone(
            "Primera Huellita",
            "Realizaste tu primera donación.",
            Icons.favorite,
            true,
            true,
          ),
          _buildMilestone(
            "Padrino de Bronce",
            "Apoyaste a un perrito por 3 meses.",
            Icons.shield,
            false, // Aún no completado
            true,
          ),
          _buildMilestone(
            "Héroe de Arequipa",
            "Ayudaste a financiar un rescate crítico.",
            Icons.location_city,
            false,
            true,
          ),
          _buildMilestone(
            "Guardián Legendario",
            "Más de 1 año salvando vidas.",
            Icons.workspace_premium,
            false,
            false, // Último elemento, sin línea
          ),
        ],
      ),
    );
  }

  Widget _buildMilestone(
    String titulo,
    String sub,
    IconData icono,
    bool completado,
    bool mostrarLinea,
  ) {
    Color colorPrincipal = completado ? const Color(0xFF03A9F4) : Colors.grey.shade300;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            // Círculo del hito
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: colorPrincipal,
                shape: BoxShape.circle,
                boxShadow: completado
                    ? [
                        BoxShadow(
                          color: colorPrincipal.withValues(alpha: 0.4),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        )
                      ]
                    : [],
              ),
              child: Icon(icono, color: Colors.white, size: 28),
            ),
            // Línea conectora
            if (mostrarLinea)
              Container(
                width: 3,
                height: 60,
                color: colorPrincipal,
              ),
          ],
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              Text(
                titulo,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: completado ? Colors.black87 : Colors.grey.shade600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                sub,
                style: TextStyle(
                  fontSize: 13,
                  color: completado ? Colors.grey.shade700 : Colors.grey.shade400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}