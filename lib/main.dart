import 'package:flutter/material.dart';
import 'package:myapp/screens/galeria_screen.dart';
import 'package:myapp/screens/inicio_bienvenido_screen.dart';
import 'package:myapp/screens/mis_sesiones_screen.dart';
import 'package:myapp/screens/perfil_screen.dart';

void main() => runApp(const MaterialApp(home: MainView()));

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _selectedIndex = 0; // Empezamos en Inicio

  final List<Widget> _screens = [
    const InicioBienvenidoScreen(),
    const MisSesionesScreen(),
    const GaleriaScreen(),
    const PerfilScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.camera_alt, color: Color(0xFF2E406E)),
            SizedBox(width: 8),
            Text(
              "STUDIO MOCHI 22PX",
              style: TextStyle(
                color: Color(0xFF2E406E),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF2E406E),
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt_outlined),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Sesiones',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.image), label: 'Galería'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }
}
