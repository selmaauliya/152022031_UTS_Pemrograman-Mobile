import 'package:flutter/material.dart';

class BeritaPage extends StatelessWidget {
  const BeritaPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Data berita statis yang lebih realistis
    final List<Map<String, dynamic>> berita = [
      {
        'title': 'Flutter 3.0 Rilis dengan Dukungan Windows dan macOS',
        'summary': 'Google merilis Flutter 3.0 dengan dukungan stabil untuk Windows, macOS, dan Linux...',
        'category': 'Teknologi',
        'author': 'Tech News',
        'time': '2 jam lalu',
        'image': 'https://images.unsplash.com/photo-1555066931-4365d14bab8c?w=400',
        'readTime': '3 min baca',
        'isTrending': true,
      },
      {
        'title': 'Peningkatan Ekonomi Digital Indonesia Capai 25%',
        'summary': 'Ekonomi digital Indonesia menunjukkan pertumbuhan signifikan di kuartal pertama...',
        'category': 'Ekonomi',
        'author': 'Bisnis Daily',
        'time': '4 jam lalu',
        'image': 'https://images.unsplash.com/photo-1460925895917-afdab827c52f?w=400',
        'readTime': '4 min baca',
        'isTrending': false,
      },
      {
        'title': 'Timnas Indonesia Juara Piala AFF 2024',
        'summary': 'Timnas Indonesia berhasil merebut gelar juara Piala AFF setelah mengalahkan Thailand...',
        'category': 'Olahraga',
        'author': 'Sport News',
        'time': '6 jam lalu',
        'image': 'https://images.unsplash.com/photo-1574629810360-7efbbe195018?w=400',
        'readTime': '5 min baca',
        'isTrending': true,
      },
      {
        'title': 'Festival Budaya Jawa Kembali Digelar di Yogyakarta',
        'summary': 'Festival budaya tahunan menampilkan berbagai kesenian tradisional dari seluruh Jawa...',
        'category': 'Budaya',
        'author': 'Culture Update',
        'time': '8 jam lalu',
        'image': 'https://images.unsplash.com/photo-1547471080-7cc2caa01a7e?w=400',
        'readTime': '3 min baca',
        'isTrending': false,
      },
      {
        'title': 'Inovasi Terbaru di Bidang Kesehatan: AI untuk Diagnosis',
        'summary': 'Teknologi AI mulai digunakan untuk membantu diagnosis penyakit dengan akurasi tinggi...',
        'category': 'Kesehatan',
        'author': 'Health Tech',
        'time': '1 hari lalu',
        'image': 'https://images.unsplash.com/photo-1559757148-5c350d0d3c56?w=400',
        'readTime': '6 min baca',
        'isTrending': true,
      },
      {
        'title': 'Pameran Seni Modern di Galeri Nasional',
        'summary': 'Pameran menampilkan karya-karya seniman muda Indonesia dengan tema modernitas...',
        'category': 'Seni',
        'author': 'Art Scene',
        'time': '1 hari lalu',
        'image': 'https://images.unsplash.com/photo-1563089145-599997674d42?w=400',
        'readTime': '2 min baca',
        'isTrending': false,
      },
      {
        'title': 'Startup Lokal Raih Pendanaan Series B',
        'summary': 'Startup teknologi asal Indonesia berhasil mengumpulkan pendanaan 50 juta...',
        'category': 'Startup',
        'author': 'Investor News',
        'time': '2 hari lalu',
        'image': 'https://images.unsplash.com/photo-1556761175-b413da4baf72?w=400',
        'readTime': '4 min baca',
        'isTrending': false,
      },
      {
        'title': 'Kuliner Street Food Terbaik 2024',
        'summary': 'Daftar street food terbaik yang wajib dicoba di berbagai kota besar Indonesia...',
        'category': 'Kuliner',
        'author': 'Food Travel',
        'time': '2 hari lalu',
        'image': 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=400',
        'readTime': '3 min baca',
        'isTrending': true,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Berita Terkini',
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
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.white),
            onPressed: () {
              // Aksi notifikasi
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header dengan kategori
            _buildCategoryHeader(),

            // Berita trending
            _buildTrendingSection(berita.where((b) => b['isTrending'] == true).toList()),

            // Semua berita
            _buildAllNewsSection(berita),
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildCategoryHeader() {
    final List<String> categories = [
      'Semua', 'Trending', 'Teknologi', 'Olahraga', 'Ekonomi', 'Hiburan'
    ];

    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(right: 12, top: 16, bottom: 16),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: index == 0 ? Colors.blue[800] : Colors.grey[200],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              categories[index],
              style: TextStyle(
                color: index == 0 ? Colors.white : Colors.grey[800],
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTrendingSection(List<Map<String, dynamic>> trendingNews) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Trending Now',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 280,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: trendingNews.length,
            itemBuilder: (context, index) {
              final news = trendingNews[index];
              return _buildTrendingCard(news, context);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTrendingCard(Map<String, dynamic> news, BuildContext context) {
    return Container(
      width: 280,
      margin: const EdgeInsets.only(right: 16),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar berita
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(
                news['image'],
                height: 140,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 140,
                    color: Colors.grey[300],
                    child: const Icon(Icons.image, size: 50, color: Colors.grey),
                  );
                },
              ),
            ),

            // Badge trending
            Positioned(
              top: 8,
              left: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'TRENDING',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // Konten
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Kategori dan waktu
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: _getCategoryColor(news['category']).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          news['category'],
                          style: TextStyle(
                            color: _getCategoryColor(news['category']),
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        news['time'],
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // Judul
                  Text(
                    news['title'],
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      height: 1.3,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 8),

                  // Author dan read time
                  Row(
                    children: [
                      Text(
                        news['author'],
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 10,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 2,
                        height: 2,
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        news['readTime'],
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAllNewsSection(List<Map<String, dynamic>> allNews) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Semua Berita',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: allNews.length,
            itemBuilder: (context, index) {
              final news = allNews[index];
              return _buildNewsCard(news, context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildNewsCard(Map<String, dynamic> news, BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: InkWell(
          onTap: () {
            // Navigasi ke detail berita
            _showNewsDetail(context, news);
          },
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Gambar berita
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    news['image'],
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 80,
                        height: 80,
                        color: Colors.grey[300],
                        child: const Icon(Icons.article, size: 30, color: Colors.grey),
                      );
                    },
                  ),
                ),

                const SizedBox(width: 12),

                // Konten berita
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Kategori
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: _getCategoryColor(news['category']).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              news['category'],
                              style: TextStyle(
                                color: _getCategoryColor(news['category']),
                                fontSize: 8,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          if (news['isTrending']) ...[
                            const SizedBox(width: 6),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                              decoration: BoxDecoration(
                                color: Colors.red.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                'TRENDING',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 6,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                          const Spacer(),
                          Text(
                            news['time'],
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 6),

                      // Judul
                      Text(
                        news['title'],
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          height: 1.3,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),

                      const SizedBox(height: 4),

                      // Ringkasan
                      Text(
                        news['summary'],
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                          height: 1.3,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),

                      const SizedBox(height: 6),

                      // Footer
                      Row(
                        children: [
                          Text(
                            news['author'],
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 10,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            width: 2,
                            height: 2,
                            decoration: BoxDecoration(
                              color: Colors.grey[400],
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            news['readTime'],
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 10,
                            ),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.bookmark_border,
                            size: 16,
                            color: Colors.grey[400],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: 0,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue[800],
      unselectedItemColor: Colors.grey[600],
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Beranda',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.explore),
          label: 'Jelajah',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark_border),
          label: 'Disimpan',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profil',
        ),
      ],
    );
  }

  void _showNewsDetail(BuildContext context, Map<String, dynamic> news) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.9,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Header image
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                      child: Image.network(
                        news['image'],
                        height: 250,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: 250,
                            color: Colors.grey[300],
                            child: const Icon(Icons.article, size: 60, color: Colors.grey),
                          );
                        },
                      ),
                    ),
                    Positioned(
                      top: 16,
                      left: 16,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.close, color: Colors.white),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ),
                    ),
                  ],
                ),

                // Content
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Category and time
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: _getCategoryColor(news['category']).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              news['category'],
                              style: TextStyle(
                                color: _getCategoryColor(news['category']),
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            news['time'],
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // Title
                      Text(
                        news['title'],
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          height: 1.3,
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Author and read time
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 16,
                            backgroundColor: Colors.grey[300],
                            child: Text(
                              news['author'].toString().substring(0, 1),
                              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                news['author'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                '${news['readTime']} • ${news['time']}',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // Content
                      Text(
                        '${news['summary']} Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                        style: const TextStyle(
                          fontSize: 16,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Color _getCategoryColor(String category) {
    switch (category) {
      case 'Teknologi':
        return Colors.blue;
      case 'Ekonomi':
        return Colors.green;
      case 'Olahraga':
        return Colors.orange;
      case 'Budaya':
        return Colors.purple;
      case 'Kesehatan':
        return Colors.red;
      case 'Seni':
        return Colors.pink;
      case 'Startup':
        return Colors.cyan;
      case 'Kuliner':
        return Colors.brown;
      default:
        return Colors.grey;
    }
  }
}