import 'package:flutter/material.dart';

class CuacaPage extends StatelessWidget {
  const CuacaPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Data statis contoh yang lebih lengkap
    final weather = {
      'city': 'Bandung',
      'temp': '28°C',
      'humidity': '70%',
      'condition': 'Berawan',
      'feelsLike': '30°C',
      'wind': '12 km/jam',
      'pressure': '1013 hPa',
      'visibility': '10 km',
      'uvIndex': '6',
      'sunrise': '05:45',
      'sunset': '18:15',
      'icon': '🌤️',
    };

    // Data forecast untuk 5 hari ke depan
    final List<Map<String, String>> forecast = [
      {'day': 'Sen', 'temp': '29°C', 'icon': '☀️', 'condition': 'Cerah'},
      {'day': 'Sel', 'temp': '28°C', 'icon': '🌤️', 'condition': 'Berawan'},
      {'day': 'Rab', 'temp': '27°C', 'icon': '🌧️', 'condition': 'Hujan Ringan'},
      {'day': 'Kam', 'temp': '26°C', 'icon': '⛈️', 'condition': 'Badai Petir'},
      {'day': 'Jum', 'temp': '28°C', 'icon': '🌤️', 'condition': 'Berawan'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Info Cuaca',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: _getAppBarColor(weather['condition']!),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            onPressed: () {
              // Aksi refresh
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: _getBackgroundGradient(weather['condition']!),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header dengan informasi utama
              _buildWeatherHeader(weather),

              // Informasi detail cuaca
              _buildWeatherDetails(weather),

              // Forecast 5 hari
              _buildWeatherForecast(forecast),

              // Additional info
              _buildAdditionalInfo(weather),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWeatherHeader(Map<String, String> weather) {
    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          // Lokasi
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.location_on, color: Colors.white, size: 20),
              const SizedBox(width: 8),
              Text(
                weather['city']!,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Icon dan suhu besar
          Stack(
            alignment: Alignment.center,
            children: [
              // Lingkaran dekoratif
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.1),
                ),
              ),

              Column(
                children: [
                  // Emoji/icon cuaca besar
                  Text(
                    weather['icon']!,
                    style: const TextStyle(fontSize: 80),
                  ),

                  const SizedBox(height: 10),

                  // Suhu
                  Text(
                    weather['temp']!,
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 5),

                  // Kondisi cuaca
                  Text(
                    weather['condition']!,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 5),

                  // Feels like
                  Text(
                    'Terasa seperti ${weather['feelsLike']}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWeatherDetails(Map<String, String> weather) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: Column(
        children: [
          const Text(
            'Detail Cuaca',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 15),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildDetailItem(
                icon: Icons.water_drop,
                value: weather['humidity']!,
                label: 'Kelembapan',
              ),
              _buildDetailItem(
                icon: Icons.air,
                value: weather['wind']!,
                label: 'Angin',
              ),
              _buildDetailItem(
                icon: Icons.speed,
                value: weather['pressure']!,
                label: 'Tekanan',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWeatherForecast(List<Map<String, String>> forecast) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Prakiraan 5 Hari',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 15),

          Column(
            children: forecast.map((day) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        day['day']!,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    Expanded(
                      flex: 1,
                      child: Text(
                        day['icon']!,
                        style: const TextStyle(fontSize: 24),
                        textAlign: TextAlign.center,
                      ),
                    ),

                    Expanded(
                      flex: 3,
                      child: Text(
                        day['condition']!,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                    ),

                    Expanded(
                      flex: 1,
                      child: Text(
                        day['temp']!,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildAdditionalInfo(Map<String, String> weather) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildAdditionalItem(
            icon: Icons.wb_sunny,
            value: weather['uvIndex']!,
            label: 'UV',
          ),
          _buildAdditionalItem(
            icon: Icons.visibility,
            value: weather['visibility']!,
            label: 'Jarak Pandang',
          ),
          _buildAdditionalItem(
            icon: Icons.nightlight_round,
            value: '${weather['sunrise']!}/${weather['sunset']!}',
            label: 'Terbit/Terbenam',
          ),
        ],
      ),
    );
  }

  Widget _buildDetailItem({
    required IconData icon,
    required String value,
    required String label,
  }) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 30),
        const SizedBox(height: 5),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.white.withOpacity(0.8),
          ),
        ),
      ],
    );
  }

  Widget _buildAdditionalItem({
    required IconData icon,
    required String value,
    required String label,
  }) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 24),
        const SizedBox(height: 5),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            color: Colors.white.withOpacity(0.8),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  // Fungsi untuk menentukan gradient background berdasarkan kondisi cuaca
  LinearGradient _getBackgroundGradient(String condition) {
    if (condition.toLowerCase().contains('cerah')) {
      return const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF47AB2F), Color(0xFFB3E57C)],
      );
    } else if (condition.toLowerCase().contains('berawan')) {
      return const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF6B7B8C), Color(0xFFB8C6CC)],
      );
    } else if (condition.toLowerCase().contains('hujan')) {
      return const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF4A6572), Color(0xFF344955)],
      );
    } else if (condition.toLowerCase().contains('badai')) {
      return const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF2C3E50), Color(0xFF34495E)],
      );
    } else {
      return const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF2196F3), Color(0xFF21CBF3)],
      );
    }
  }

  // Fungsi untuk menentukan warna app bar berdasarkan kondisi cuaca
  Color _getAppBarColor(String condition) {
    if (condition.toLowerCase().contains('cerah')) {
      return const Color(0xFF47AB2F);
    } else if (condition.toLowerCase().contains('berawan')) {
      return const Color(0xFF6B7B8C);
    } else if (condition.toLowerCase().contains('hujan')) {
      return const Color(0xFF4A6572);
    } else if (condition.toLowerCase().contains('badai')) {
      return const Color(0xFF2C3E50);
    } else {
      return const Color(0xFF2196F3);
    }
  }
}