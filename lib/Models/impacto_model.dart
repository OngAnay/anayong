import 'package:flutter/material.dart';

class IndicadorImpacto {
  final String id;
  final String titulo;
  final String cantidadLograda; // Ej: '150', '2.5 Toneladas'
  final String descripcion;     // Ej: 'Perritos con nuevo hogar'
  final IconData icono;
  final Color colorTema;

  IndicadorImpacto({
    required this.id,
    required this.titulo,
    required this.cantidadLograda,
    required this.descripcion,
    required this.icono,
    required this.colorTema,
  });
}