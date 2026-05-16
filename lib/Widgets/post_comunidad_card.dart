import 'package:flutter/material.dart';
import 'package:ong_anay/Models/comunidad_model.dart';

class PostComunidadCard extends StatelessWidget {
  final PostComunidad post;

  const PostComunidadCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cabecera: Avatar, Nombre y Tiempo
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(post.avatarUrl),
                  radius: 20,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.autor,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Text(
                        post.tiempo,
                        style: const TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.more_vert, color: Colors.grey),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 10),
            
            // Contenido del texto
            Text(
              post.contenido,
              style: const TextStyle(fontSize: 14, height: 1.4),
            ),
            
            // Imagen adjunta (Si existe) - CORREGIDO AQUÍ
            if (post.imagenUrl != null) ...[
              const SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxHeight: 200, // Aquí limitamos la altura correctamente
                  ),
                  child: Image.network(
                    post.imagenUrl!,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
            
            const SizedBox(height: 12),
            const Divider(height: 1),
            const SizedBox(height: 4),
            
            // Botones de Interacción (Like, Comentar)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_border, color: Color(0xFFFF7F50), size: 20),
                  label: Text('${post.likes}', style: const TextStyle(color: Colors.grey)),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.chat_bubble_outline, color: Color(0xFF008080), size: 20),
                  label: Text('${post.comentarios}', style: const TextStyle(color: Colors.grey)),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.share_outlined, color: Colors.grey, size: 20),
                  label: const Text('Compartir', style: TextStyle(color: Colors.grey, fontSize: 12)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}