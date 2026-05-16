import 'package:flutter/material.dart';
import 'package:ong_anay/Models/comunidad_model.dart';
import 'package:ong_anay/Widgets/post_comunidad_card.dart';

class ComunidadesInteresScreen extends StatelessWidget {
  const ComunidadesInteresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Datos de prueba para simular el foro social de Añay
    final listaPosts = [
      PostComunidad(
        id: '1',
        autor: 'Mariana Flores',
        avatarUrl: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&q=80',
        tiempo: 'Hace 45 min',
        contenido: '¡Miren lo feliz que está Firulais en su nuevo hogar! Lo adoptamos hace una semana en el albergue de Chiguata y ya es el rey de la casa. Gracias Añay por hacer esto posible. ❤️🐶',
        imagenUrl: 'https://images.unsplash.com/photo-1543466835-00a7907e9de1?auto=format&fit=crop&q=80',
        likes: 24,
        comentarios: 5,
      ),
      PostComunidad(
        id: '2',
        autor: 'Carlos Benavente',
        avatarUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&q=80',
        tiempo: 'Hace 3 horas',
        contenido: 'Hola comunidad, se necesitan voluntarios este sábado para ayudar a pintar los caniles del refugio temporal. ¿Alguien se apunta para ir en grupo desde el centro?',
        likes: 12,
        comentarios: 8,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Comunidad Añay',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.grey[100],
      body: ListView.builder(
        itemCount: listaPosts.length,
        itemBuilder: (context, index) {
          return PostComunidadCard(post: listaPosts[index]);
        },
      ),
      // Botón flotante para crear una nueva publicación
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Función para crear publicación próximamente')),
          );
        },
        backgroundColor: const Color(0xFFFF7F50), // Coral Vivo
        child: const Icon(Icons.create, color: Colors.white),
      ),
    );
  }
}