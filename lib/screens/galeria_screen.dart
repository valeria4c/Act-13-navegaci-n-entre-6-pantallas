import 'dart:developer' as developer;
import 'package:flutter/material.dart';

class GaleriaScreen extends StatelessWidget {
  const GaleriaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Mis galerías privadas",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          TextField(
            decoration: InputDecoration(
              hintText: "BUSCAR GALERÍA...",
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              filled: true,
              fillColor: Colors.grey[100],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView(
              children: [
                _buildGalleryItem(
                  "Boda",
                  "24/07/2024",
                  "https://raw.githubusercontent.com/valeria4c/imagenes/main/BODA1.jpg",
                ),
                _buildGalleryItem(
                  "Familiar",
                  "15/06/2024",
                  "https://raw.githubusercontent.com/valeria4c/imagenes/main/FOTO6.jpg",
                ),
                _buildGalleryItem(
                  "XV Años",
                  "03/03/2024",
                  "https://raw.githubusercontent.com/valeria4c/imagenes/main/FOTO5.jpg",
                ),
                _buildGalleryItem(
                  "Cumpleaños",
                  "10/01/2024",
                  "https://raw.githubusercontent.com/valeria4c/imagenes/main/CUMPLEA%C3%91OS.jpg",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGalleryItem(String title, String date, String imageUrl) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            SizedBox(
              width: 80,
              height: 80,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    developer.log(
                      'Error al cargar la imagen: $imageUrl',
                      name: 'ImageError',
                      error: error,
                      stackTrace: stackTrace,
                    );
                    return const Icon(Icons.error, size: 40, color: Colors.red);
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
                      fontSize: 16,
                    ),
                  ),
                  Text(date, style: const TextStyle(color: Colors.grey)),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF637699),
                    ),
                    child: const Text(
                      "VER",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.more_vert),
          ],
        ),
      ),
    );
  }
}
