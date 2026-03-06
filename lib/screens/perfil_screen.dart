import 'package:flutter/material.dart';
import 'package:myapp/screens/config_screen.dart';
import 'package:myapp/screens/editar_informacion_screen.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        const CircleAvatar(
          radius: 50,
          backgroundColor: Colors.grey,
          child: Icon(Icons.person, size: 60, color: Colors.white),
        ),
        const SizedBox(height: 10),
        const Text(
          "Valeria Herrera 6- I",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 30),
        _profileOption(context, "Configuración", () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ConfigScreen()),
          );
        }),
        _profileOption(context, "Información de trabajo", () {}),
        _profileOption(context, "Editar Información", () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const EditarInformacionScreen(),
            ),
          );
        }),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2E406E),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: const Text(
                "Cerrar sesión",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _profileOption(
    BuildContext context,
    String title,
    VoidCallback onTap,
  ) {
    return ListTile(
      title: Text(title, style: const TextStyle(fontSize: 18)),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
