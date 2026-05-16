import 'package:flutter/material.dart';

class Aliado {
  final String id;
  final String nombre;
  final String rubro;        // 'Veterinaria', 'Pet Shop', 'Cafeteria', etc.
  final String beneficio;    // El descuento o promo (Ej: '20% de descuento')
  final String imagenUrl;
  final IconData icono;

  Aliado({
    required this.id,
    required this.nombre,
    required this.rubro,
    required this.beneficio,
    required this.imagenUrl,
    required this.icono,
  });
}