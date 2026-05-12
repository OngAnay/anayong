import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF03A9F4), Color(0xFF01579B)],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // LOGO
            const CircleAvatar(
              radius: 60,
              backgroundColor: Colors.white,
              child: Icon(Icons.pets, size: 70, color: Color(0xFF03A9F4)),
            ),
            const SizedBox(height: 30),
            const Text(
              "AÑAY",
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.w900,
                letterSpacing: 5,
              ),
            ),
            const Text(
              "Huellitas con Futuro",
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            const SizedBox(height: 60),

            // BOTÓN GOOGLE
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ElevatedButton(
                onPressed: () {
                  // Aquí Johncito integrará la autenticación de Google
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black87,
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.account_circle, color: Colors.red), // Icono de cuenta
                    SizedBox(width: 10),
                    Text(
                      "Continuar con Google", 
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // BOTÓN INVITADO
            TextButton(
              onPressed: () {
                 Navigator.pushNamed(context, '/catalogo');
              },
              child: const Text(
                "Entrar como invitado",
                style: TextStyle(
                  color: Colors.white, 
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}