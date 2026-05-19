class Albergue {
  final String id; // <-- Agregado de raíz
  final String nombre;
  final String ubicacion;
  final String resena; 
  final String imagenUrl;
  final int cantidadPerros;
  final double metaDonacion;
  final double recaudado;

  // Constructor completo
  Albergue({
    required this.id, // <-- Agregado aquí también
    required this.nombre,
    required this.ubicacion,
    required this.resena,
    required this.imagenUrl,
    required this.cantidadPerros,
    required this.metaDonacion,
    required this.recaudado,
  });
}