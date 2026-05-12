import 'package:flutter/material.dart';

class FeedVideosScreen extends StatelessWidget {
  const FeedVideosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Fondo negro tipo TikTok
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 5, // Simulamos 5 videos
        itemBuilder: (context, index) {
          return Stack(
            children: [
              // ESPACIO PARA EL VIDEO (Placeholder)
              Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.black87,
                child: const Center(
                  child: Icon(Icons.play_circle_fill, size: 80, color: Colors.white30),
                ),
              ),

              // GRADIENTE INFERIOR (Para que el texto se lea mejor)
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.7),
                    ],
                  ),
                ),
              ),

              // INFORMACIÓN DEL VIDEO (Abajo a la izquierda)
              Positioned(
                bottom: 40,
                left: 20,
                right: 80, // Evita que el texto choque con los botones
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "@AlbergueChiguata",
                      style: TextStyle(
                        color: Colors.white, 
                        fontWeight: FontWeight.bold, 
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Miren cómo corre 'Bobby' hoy en el refugio. ¡Ya está listo para un hogar!",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),

              // BOTONES DE INTERACCIÓN (Derecha)
              Positioned(
                bottom: 40,
                right: 15,
                child: Column(
                  children: [
                    _buildIconButton(Icons.favorite, "1.2k", Colors.redAccent),
                    const SizedBox(height: 20),
                    _buildIconButton(Icons.comment, "45", Colors.white),
                    const SizedBox(height: 20),
                    _buildIconButton(Icons.share, "Compartir", Colors.white),
                    const SizedBox(height: 20),
                    const CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white24,
                      child: Icon(Icons.pets, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildIconButton(IconData icono, String label, Color color) {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(icono, color: color, size: 35),
        ),
        Text(
          label, 
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
      ],
    );
  }
}