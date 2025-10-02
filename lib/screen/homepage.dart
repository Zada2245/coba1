import 'package:flutter/material.dart';
import 'package:coba1/data/buku.dart';
import 'package:coba1/screen/book.dart';
import 'package:coba1/screen/detail_page.dart';

class HomePage extends StatelessWidget {
  final String username;
  const HomePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Book Store"),
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView.builder(
        itemCount: bookList.length,
        padding: const EdgeInsets.all(12),
        itemBuilder: (context, index) {
          Book book = bookList[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailPage(book: book)),
              );
            },
            child: Card(
              margin: const EdgeInsets.only(bottom: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 3,
              child: Row(
                children: [
                  // Gambar dari URL
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                    child: Image.network(
                      book.imageUrls[0], // ambil gambar pertama
                      height: 120,
                      width: 90,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 120,
                          width: 90,
                          color: Colors.grey.shade300,
                          child: const Icon(Icons.broken_image, size: 40),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Info buku
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            book.title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "By ${book.author}",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade700,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            book.price,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
