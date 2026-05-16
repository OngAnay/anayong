import "package:flutter/material.dart";
import "logistica_donaciones_screen.dart";
import "albergue_model.dart"; 

class PerfilAlbergueScreen extends StatelessWidget {
  final Albergue albergue; 

  const PerfilAlbergueScreen({
    super.key,
    required this.albergue,
  });

  @override
  Widget build(BuildContext context) {
    double progresoDonacion = 0.0;
    if (albergue.metaDonacion > 0) {
      progresoDonacion = albergue.recaudado / albergue.metaDonacion;
      if (progresoDonacion > 1.0) progresoDonacion = 1.0;
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250.0,
            floating: false,
            pinned: true,
            backgroundColor: const Color(0xFF008080), 
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                albergue.nombre, 
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              background: albergue.imagenUrl.isNotEmpty
                  ? Image.network(
                      albergue.imagenUrl, 
                      fit: BoxFit.cover,
                    )
                  : Container(color: Colors.grey[300]), 
            ),
          ),
          
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildStat("${albergue.cantidadPerros}", "Perros"),
                        _buildStat("-", "Gatos"), 
                        _buildStat("${(progresoDonacion * 100).toInt()}%", "Meta"),
                      ],
                    ),
                    const SizedBox(height: 25),
                    
                    const Text(
                      "Sobre nosotros", 
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF008080)),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      albergue.resena, // Cambiado aquí
                      style: const TextStyle(fontSize: 16, height: 1.5),
                    ),
                    
                    const SizedBox(height: 25),
                    const Text(
                      "Estado de Recaudación", 
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF008080)),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Meta: ${albergue.metaDonacion.toInt()} soles', 
                          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                        ),
                        Text(
                          'Recaudado: ${albergue.recaudado.toInt()} soles', 
                          style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    LinearProgressIndicator(
                      value: progresoDonacion,
                      backgroundColor: Colors.grey[200],
                      color: const Color(0xFFFF7F50), 
                      minHeight: 10,
                    ),
                    
                    const SizedBox(height: 25),
                    const Text("Ubicación", 
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    ListTile(
                      leading: const Icon(Icons.location_on, color: Color(0xFFFF7F50)),
                      title: Text(albergue.ubicacion), 
                    ),
                    
                    const SizedBox(height: 30),
                    
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const LogisticaDonacionesScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF7F50), 
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        ),
                        child: const Text(
                          "APOYAR A ESTE ALBERGUE", 
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
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