import 'package:flutter/material.dart';
import 'biodata_page.dart';
import 'kontak_page.dart';
import 'kalkulator_page.dart';
import 'cuaca_page.dart';
import 'berita_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    BiodataPage(),
    KontakPage(),
    KalkulatorPage(),
    CuacaPage(),
    BeritaPage(),
  ];

  final List<NavigationDestination> destinations = const [
    NavigationDestination(icon: Icon(Icons.person), label: 'Biodata'),
    NavigationDestination(icon: Icon(Icons.contacts), label: 'Kontak'),
    NavigationDestination(icon: Icon(Icons.calculate), label: 'Kalkulator'),
    NavigationDestination(icon: Icon(Icons.cloud), label: 'Cuaca'),
    NavigationDestination(icon: Icon(Icons.article), label: 'Berita'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar bisa dikustom nanti per halaman kalau perlu
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: destinations,
      ),
    );
  }
}
