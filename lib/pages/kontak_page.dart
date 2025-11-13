import 'package:flutter/material.dart';

class KontakPage extends StatelessWidget {
  const KontakPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Data kontak statis dengan nama dan nomor yang lebih realistis
    final List<Map<String, String>> contacts = [
      {
        'name': 'Ahmad Rizki',
        'phone': '+62 812-3456-7890',
        'initial': 'AR',
        'color': '0xFF4285F4'
      },
      {
        'name': 'Sari Dewi',
        'phone': '+62 813-9876-5432',
        'initial': 'SD',
        'color': '0xFFEA4335'
      },
      {
        'name': 'Budi Santoso',
        'phone': '+62 814-1234-5678',
        'initial': 'BS',
        'color': '0xFF34A853'
      },
      {
        'name': 'Maya Indah',
        'phone': '+62 815-8765-4321',
        'initial': 'MI',
        'color': '0xFFFBBC05'
      },
      {
        'name': 'Rizky Pratama',
        'phone': '+62 816-5555-1234',
        'initial': 'RP',
        'color': '0xFF4285F4'
      },
      {
        'name': 'Diana Putri',
        'phone': '+62 817-8888-9999',
        'initial': 'DP',
        'color': '0xFFEA4335'
      },
      {
        'name': 'Hendra Wijaya',
        'phone': '+62 818-7777-6666',
        'initial': 'HW',
        'color': '0xFF34A853'
      },
      {
        'name': 'Lina Marlina',
        'phone': '+62 819-4444-3333',
        'initial': 'LM',
        'color': '0xFFFBBC05'
      },
      {
        'name': 'Fajar Nugroho',
        'phone': '+62 820-2222-1111',
        'initial': 'FN',
        'color': '0xFF4285F4'
      },
      {
        'name': 'Citra Ayu',
        'phone': '+62 821-6666-7777',
        'initial': 'CA',
        'color': '0xFFEA4335'
      },
      {
        'name': 'Eko Prasetyo',
        'phone': '+62 822-3333-4444',
        'initial': 'EP',
        'color': '0xFF34A853'
      },
      {
        'name': 'Gita Sari',
        'phone': '+62 823-9999-8888',
        'initial': 'GS',
        'color': '0xFFFBBC05'
      },
      {
        'name': 'Irfan Maulana',
        'phone': '+62 824-1111-2222',
        'initial': 'IM',
        'color': '0xFF4285F4'
      },
      {
        'name': 'Nina Rosita',
        'phone': '+62 825-7777-5555',
        'initial': 'NR',
        'color': '0xFFEA4335'
      },
      {
        'name': 'Oscar Fernando',
        'phone': '+62 826-4444-6666',
        'initial': 'OF',
        'color': '0xFF34A853'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Kontak',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue[800],
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              // Aksi search
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Header dengan jumlah kontak
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.grey[50],
            child: Row(
              children: [
                Icon(Icons.people, color: Colors.blue[800], size: 20),
                const SizedBox(width: 8),
                Text(
                  '${contacts.length} kontak',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          // Daftar kontak
          Expanded(
            child: ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                final contact = contacts[index];
                final color = Color(int.parse(contact['color']!));

                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    leading: Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                        color: color.withOpacity(0.2),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: color.withOpacity(0.3),
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          contact['initial']!,
                          style: TextStyle(
                            color: color,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      contact['name']!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      contact['phone']!,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                    trailing: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.green[50],
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.phone,
                          color: Colors.green[600],
                          size: 20,
                        ),
                        onPressed: () {
                          // Aksi telepon
                          _showCallDialog(context, contact['name']!, contact['phone']!);
                        },
                      ),
                    ),
                    onTap: () {
                      // Aksi ketika kontak ditekan
                      _showContactDetail(context, contact);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),

      // Floating Action Button untuk menambah kontak
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Aksi tambah kontak
        },
        backgroundColor: Colors.blue[800],
        child: const Icon(Icons.person_add, color: Colors.white),
      ),
    );
  }

  void _showCallDialog(BuildContext context, String name, String phone) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Panggilan Telepon'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Hubungi $name?'),
              Text(
                phone,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Di sini bisa ditambahkan logika untuk benar-benar menelpon
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Memanggil $name...'),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text('Panggil', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  void _showContactDetail(BuildContext context, Map<String, String> contact) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        final color = Color(int.parse(contact['color']!));

        return Container(
          height: MediaQuery.of(context).size.height * 0.7,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              // Header dengan avatar besar
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: color.withOpacity(0.2),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: color.withOpacity(0.4),
                          width: 3,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          contact['initial']!,
                          style: TextStyle(
                            color: color,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      contact['name']!,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      contact['phone']!,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),

              // Action buttons
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildActionButton(
                      icon: Icons.phone,
                      label: 'Panggil',
                      color: Colors.green,
                      onTap: () {
                        Navigator.of(context).pop();
                        _showCallDialog(context, contact['name']!, contact['phone']!);
                      },
                    ),
                    _buildActionButton(
                      icon: Icons.message,
                      label: 'Pesan',
                      color: Colors.blue,
                      onTap: () {
                        // Aksi kirim pesan
                      },
                    ),
                    _buildActionButton(
                      icon: Icons.videocam,
                      label: 'Video',
                      color: Colors.purple,
                      onTap: () {
                        // Aksi video call
                      },
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // Tombol tutup
              Padding(
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[200],
                      foregroundColor: Colors.grey[800],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Tutup'),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
            border: Border.all(color: color.withOpacity(0.3)),
          ),
          child: IconButton(
            icon: Icon(icon, color: color),
            onPressed: onTap,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}