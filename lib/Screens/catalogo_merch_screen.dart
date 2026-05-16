import 'package:flutter/material.dart';
import 'package:ong_anay/Models/producto_model.dart';
import 'package:ong_anay/Widgets/producto_card.dart';

class CatalogoMerchScreen extends StatelessWidget {
  const CatalogoMerchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Datos de prueba: Productos de la ONG Añay
    final listaProductos = [
      ProductoMerch(
        id: '1',
        nombre: 'Polo Añay Algodón',
        precio: 45.00,
        categoria: 'Ropa',
        imagenUrl: 'https://images.unsplash.com/photo-1521572267360-ee0c2909d518?auto=format&fit=crop&q=80',
      ),
      ProductoMerch(
        id: '2',
        nombre: 'Taza Patitas Arequipa',
        precio: 25.00,
        categoria: 'Hogar',
        imagenUrl: 'https://images.unsplash.com/photo-1514228742587-6b1558fbed39?auto=format&fit=crop&q=80',
      ),
      ProductoMerch(
        id: '3',
        nombre: 'Gorra Añay Azul',
        precio: 35.00,
        categoria: 'Accesorios',
        imagenUrl: 'https://images.unsplash.com/photo-1588850561407-ed78c282e89b?auto=format&fit=crop&q=80',
      ),
      ProductoMerch(
        id: '4',
        nombre: 'Stickers Huellitas (Pack)',
        precio: 10.00,
        categoria: 'Accesorios',
        imagenUrl: 'https://images.unsplash.com/photo-1572375927902-1c093675e2cd?auto=format&fit=crop&q=80',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Catálogo Añay',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: Color(0xFF008080)),
            onPressed: () => Navigator.pushNamed(context, '/carrito'),
          ),
        ],
      ),
      backgroundColor: Colors.grey[50],
      body: Column(
        children: [
          // Banner de promoción o Categorías
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [Color(0xFF008080), Color(0xFF004D40)]),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("APOYA CON TU COMPRA", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                Text("Todo lo recaudado va a los refugios", style: TextStyle(color: Colors.white70, fontSize: 12)),
              ],
            ),
          ),

          // Cuadrícula de productos
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Dos columnas
                childAspectRatio: 0.7, // Ajuste de altura/ancho
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemCount: listaProductos.length,
              itemBuilder: (context, index) {
                return ProductoCard(
                  producto: listaProductos[index],
                  onAdd: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${listaProductos[index].nombre} añadido al carrito')),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}