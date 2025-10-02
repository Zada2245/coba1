// File: lib/home_page.dart

import 'package:coba1/LoginPage.dart';
import 'package:coba1/screen/detail_page.dart';
// Ganti import ini
import 'package:coba1/screen/book.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String username;
  HomePage({super.key, required this.username});

  // Ganti data game menjadi data buku
  final List<Book> bookList = [
    Book(
      title: 'Flutter for Beginners',
      author: 'John Smith',
      description: 'Buku pengantar Flutter untuk pemula...',
      price: 'Rp 150.000',
      imageAsset: '', // <-- TAMBAHKAN ARGUMEN INI
      imageUrls: [
        'https://miro.medium.com/v2/resize:fit:1400/format:webp/1*1BNzOqzb4U8f1D2gnObYKw.jpeg',
        'https://docs.flutter.dev/assets/images/flutter-logo-sharing.png',
      ],
      officialUrl: 'https://docs.flutter.dev/',
    ),
    Book(
      title: 'Flutter for Beginners',
      author: 'John Smith',
      description: 'Buku pengantar Flutter untuk pemula...',
      price: 'Rp 150.000',
      imageAsset: '', // <-- TAMBAHKAN ARGUMEN INI
      imageUrls: [
        'https://miro.medium.com/v2/resize:fit:1400/format:webp/1*1BNzOqzb4U8f1D2gnObYKw.jpeg',
        'https://docs.flutter.dev/assets/images/flutter-logo-sharing.png',
      ],
      officialUrl: 'https://docs.flutter.dev/',
    ),
    Book(
      title: 'Flutter for Beginners',
      author: 'John Smith',
      description: 'Buku pengantar Flutter untuk pemula...',
      price: 'Rp 150.000',
      imageAsset: '', // <-- TAMBAHKAN ARGUMEN INI
      imageUrls: [
        'https://miro.medium.com/v2/resize:fit:1400/format:webp/1*1BNzOqzb4U8f1D2gnObYKw.jpeg',
        'https://docs.flutter.dev/assets/images/flutter-logo-sharing.png',
      ],
      officialUrl: 'https://docs.flutter.dev/',
    ),
    Book(
      title: 'Flutter for Beginners',
      author: 'John Smith',
      description: 'Buku pengantar Flutter untuk pemula...',
      price: 'Rp 150.000',
      imageAsset: '', // <-- TAMBAHKAN ARGUMEN INI
      imageUrls: [
        'https://miro.medium.com/v2/resize:fit:1400/format:webp/1*1BNzOqzb4U8f1D2gnObYKw.jpeg',
        'https://docs.flutter.dev/assets/images/flutter-logo-sharing.png',
      ],
      officialUrl: 'https://docs.flutter.dev/',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Book Store"), // Ganti judul AppBar
        backgroundColor: Color(0xFF1a202c),
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('Profil $username')));
            },
            icon: Icon(Icons.person),
          ),
          IconButton(
            onPressed: () {
              _logout(context);
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      backgroundColor: Color(0xFF2d3748),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Popular Books", // Ganti judul
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 0.75,
              ),
              itemCount: bookList.length, // Ganti itemCount
              itemBuilder: (context, index) {
                final book = bookList[index]; // Ganti variabel
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        // Kirim data 'book' ke DetailPage
                        builder: (context) => DetailPage(book: book),
                      ),
                    );
                  },
                  child: Card(
                    color: Color(0xFF4a5568),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Hero(
                            tag: book.title, // Ganti tag Hero
                            child: Image.network(
                              book.imageUrls[0],
                              fit: BoxFit.cover,
                              width: double.infinity,
                              errorBuilder: (context, error, stackTrace) {
                                return Center(
                                  child: Icon(
                                    Icons.image_not_supported,
                                    color: Colors.grey,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                book.title, // Tampilkan judul buku
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 5),
                              Text(
                                book.price, // Tampilkan harga buku
                                style: TextStyle(
                                  color: Colors.greenAccent,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
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
            ),
          ),
        ],
      ),
    );
  }

  void _logout(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LoginPage();
        },
      ),
      (route) => false,
    );
  }
}
