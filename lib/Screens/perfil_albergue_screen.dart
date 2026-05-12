import "package:flutter/material.dart";import"logistica_donaciones_screen.dart";

class PerfilAlbergueScreen extends StatelessWidget {
  const PerfilAlbergueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // CABECERA XL CON FOTO
          SliverAppBar(
            expandedHeight: 250.0,
            floating: false,
            pinned: true,
            backgroundColor: const Color(0xFF008080), // Verde Calma
            flexibleSpace: FlexibleSpaceBar(
              title: const Text("Albergue Patitas Arequipa", 
                style: TextStyle(fontWeight: FontWeight.bold)),
              background: Image.network(
                'https://images.unsplash.com/photo-1548199973-03cce0bbc87b?auto=format&fit=crop&q=80', // Foto temporal
                fit: BoxFit.cover,
              ),
            ),
          ),
          
          // CUERPO DE LA INFORMACIÓN
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Resumen de impacto
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildStat("45", "Perros"),
                        _buildStat("12", "Gatos"),
                        _buildStat("80%", "Meta"),
                      ],
                    ),
                    const SizedBox(height: 25),
                    
                    const Text("Sobre nosotros", 
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF008080))),
                    const SizedBox(height: 10),
                    const Text(
                      "Este albergue ubicado en las faldas del Misti se dedica al rescate y rehabilitación de animales en abandono extremo. Nuestra misión con la ONG Añay es darles una vida digna.",
                      style: TextStyle(fontSize: 16, height: 1.5),
                    ),
                    
                    const SizedBox(height: 25),
                    const Text("Ubicación", 
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    const ListTile(
                      leading: Icon(Icons.location_on, color: Color(0xFFFF7F50)),
                      title: Text("Distrito de Chiguata, Arequipa"),
                    ),
                    
                    const SizedBox(height: 30),
                    
                    // BOTÓN DE ACCIÓN XL
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,MaterialPageRoute(builder:(context) => const LogisticaDonacionesScreen()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF7F50), // Coral Vivo
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        ),
                        child: const Text("APOYAR A ESTE ALBERGUE", 
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                      ),
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildStat(String value, String label) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF008080))),
        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}