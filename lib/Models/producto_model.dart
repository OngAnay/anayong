class ProductoMerch {
  final String id;
  final String nombre;
  final double precio;
  final String imagenUrl;
  final String categoria; // 'Ropa', 'Accesorios', 'Hogar'
  final bool disponible;

  ProductoMerch({
    required this.id,
    required this.nombre,
    required this.precio,
    required this.imagenUrl,
    required this.categoria,
    this.disponible = true,
  });
}