import 'package:flutter/material.dart';
import 'dashboard_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 5), () {
      if (!mounted) return;    // <-- perbaikan penting

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const DashboardPage()),
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,   // bebas ganti warna
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // FOTO ANDA
            CircleAvatar(
              radius: 60,
              backgroundImage: const AssetImage('lib/assets/images/Selmaaa.png'),
              onBackgroundImageError: (_, __) => const Icon(Icons.person, size: 80),
            ),

            const SizedBox(height: 20),

            // JUDUL APLIKASI
            const Text(
              "Aplikasi UTS Mobile",
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            // NAMA DAN NIM
            const Text(
              "Nama: Selma Auliya",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            const Text(
              "NIM: 152022031",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),

            const SizedBox(height: 40),

            const CircularProgressIndicator(color: Colors.white),
          ],
        ),
      ),
    );
  }
}