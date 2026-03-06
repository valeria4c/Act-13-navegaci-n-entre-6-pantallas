import 'dart:developer' as developer;
import 'package:flutter/material.dart';

class MisSesionesScreen extends StatelessWidget {
  const MisSesionesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "< Mis Sesiones",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          TextField(
            decoration: InputDecoration(
              hintText: "BUSCAR",
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
              fillColor: Colors.grey[200],
            ),
          ),
          const SizedBox(height: 20),
          _buildSesionItem(
            title: "Familiar",
            subtitle: "Mañana, 12:00 pm",
            status: "Próxima Sesión",
            imageUrl:
                "https://raw.githubusercontent.com/valeria4c/imagenes/main/FOTO6.jpg",
            isNext: true,
          ),
          _buildSesionItem(
            title: "XV Años",
            subtitle: "Ayer, 4:00 pm",
            status: "Completada",
            imageUrl:
                "https://raw.githubusercontent.com/valeria4c/imagenes/main/FOTO5.jpg",
          ),
          _buildSesionItem(
            title: "Boda",
            subtitle: "24/07/2024",
            status: "Confirmada",
            imageUrl:
                "https://raw.githubusercontent.com/valeria4c/imagenes/main/BODA1.jpg",
          ),
        ],
      ),
    );
  }

  Widget _buildSesionItem({
    required String title,
    required String subtitle,
    required String status,
    required String imageUrl,
    bool isNext = false,
  }) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const Center(child: CircularProgressIndicator());
                      },
                      errorBuilder: (context, error, stackTrace) {
                        developer.log(
                          'Error al cargar la imagen: $imageUrl',
                          name: 'MisSesionesScreen',
                          error: error,
                          stackTrace: stackTrace,
                        );
                        return const Icon(
                          Icons.error,
                          size: 40,
                          color: Colors.red,
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(subtitle),
                      const SizedBox(height: 4),
                      Text(
                        status,
                        style: TextStyle(
                          backgroundColor:
                              isNext ? Colors.yellow : Colors.transparent,
                          color: isNext ? Colors.black : Colors.blueGrey,
                          fontWeight:
                              isNext ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  foregroundColor: Colors.black,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text("DETALLES"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
