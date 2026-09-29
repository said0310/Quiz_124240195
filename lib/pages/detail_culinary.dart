import 'package:flutter/material.dart';

import '../models/culinaryList.dart';

// Halaman Detail Culinary [20 pts]
class CulinaryDetailPage extends StatefulWidget {
  final Culinary culinary; // Data kuliner yang diterima

  const CulinaryDetailPage({super.key, required this.culinary});

  @override
  State<CulinaryDetailPage> createState() => _CulinaryDetailPageState();
}

class _CulinaryDetailPageState extends State<CulinaryDetailPage> {
  // State untuk menyimpan status favorit
  bool _isFavorite = false;

  // Helper method — baris info (icon + label + value)
  Widget _infoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: const Color(0xFFE8EAF6),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, size: 16, color: const Color(0xFF7986CB)),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFF7986CB),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 1),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 13.5,
                    color: Colors.grey.shade800,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final culinary = widget.culinary;

    return Scaffold(
      // 1. Menampilkan Brand/Penulis + Judul pada AppBar [10 pts]
      appBar: AppBar(
        title: Text(
          '${culinary.category} - ${culinary.name}',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Color(0xFF3D4066),
          ),
        ),
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        foregroundColor: const Color.fromARGB(255, 0, 0, 0),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _isFavorite = !_isFavorite;
              });
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    _isFavorite
                        ? 'Ditambahkan ke favorit'
                        : 'Dihapus dari favorit',
                  ),
                  duration: const Duration(seconds: 1),
                ),
              );
            },
            icon: Icon(
              _isFavorite ? Icons.favorite : Icons.favorite_border,
              color: _isFavorite
                  ? Colors.red
                  : const Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          const SizedBox(width: 4),
        ],
      ),
      // 2. Menampilkan detail lain: Gambar, Deskripsi, Harga, dan Tahun [10 pts]
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar Cover Buku [10 pts]
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(121, 134, 203, 0.12),
                      blurRadius: 24,
                      offset: Offset(0, 8),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    culinary.imageUrl,
                    height: 240,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 240,
                      width: 160,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF0F1F8),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.menu_book_rounded,
                        size: 44,
                        color: Colors.grey.shade300,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Judul Buku
            Text(
              culinary.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color(0xFF3D4066),
                letterSpacing: -0.3,
              ),
            ),
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFFE8EAF6),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Asal ${culinary.origin}',
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF3949AB),
                ),
              ),
            ),
            const SizedBox(height: 18),
            // Card Deskripsi [10 pts]
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(121, 134, 203, 0.06),
                    blurRadius: 12,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE8EAF6),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.description_outlined,
                          size: 15,
                          color: Color(0xFF7986CB),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'Deskripsi',
                        style: TextStyle(
                          fontSize: 11,
                          color: Color(0xFF7986CB),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    culinary.description,
                    style: TextStyle(
                      height: 1.6,
                      fontSize: 13.5,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(121, 134, 203, 0.06),
                    blurRadius: 12,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _infoRow(
                    Icons.category_outlined,
                    'Category',
                    culinary.category,
                  ),
                  _infoRow(
                    Icons.restaurant_menu_outlined,
                    'Bahan Utama',
                    culinary.mainIngredient,
                  ),
                  _infoRow(Icons.local_pizza_outlined, 'Rasa', culinary.flavor),
                  _infoRow(
                    Icons.hot_tub_outlined,
                    'Level Pedas',
                    culinary.spicyLevel,
                  ),
                  _infoRow(
                    Icons.timer_outlined,
                    'Waktu Penyajian',
                    culinary.servingTime,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // Tombol Aksi di Bawah
    );
  }
}
