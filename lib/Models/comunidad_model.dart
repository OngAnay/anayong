class PostComunidad {
  final String id;
  final String autor;
  final String avatarUrl;
  final String tiempo;      // Ej: 'Hace 2 horas'
  final String contenido;
  final String? imagenUrl;  // Puede tener foto o ser solo texto
  final int likes;
  final int comentarios;

  PostComunidad({
    required this.id,
    required this.autor,
    required this.avatarUrl,
    required this.tiempo,
    required this.contenido,
    this.imagenUrl,
    required this.likes,
    required this.comentarios,
  });
}