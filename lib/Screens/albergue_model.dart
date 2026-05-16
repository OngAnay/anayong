class Albergue {
  final String nombre;
  final String ubicacion;
  final String resena; // Cambiado para evitar errores de caracteres
  final String imagenUrl;
  final int cantidadPerros;
  final double metaDonacion;
  final double recaudado;

  Albergue({
    required this.nombre,
    required this.ubicacion,
    required this.resena,
    required this.imagenUrl,
    required this.cantidadPerros,
    required this.metaDonacion,
    required this.recaudado,
  });
}