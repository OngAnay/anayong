class Mascota {
  final String nombre;
  final String raza;
  final String edad;     // 'Cachorro', 'Joven', 'Adulto'
  final String tamano;   // 'Pequeño', 'Mediano', 'Grande'
  final String ubicacion;
  final String imagenUrl;
  final String sexo;     // 'Macho' o 'Hembra'

  Mascota({
    required this.nombre,
    required this.raza,
    required this.edad,
    required this.tamano,
    required this.ubicacion,
    required this.imagenUrl,
    required this.sexo,
  });
}