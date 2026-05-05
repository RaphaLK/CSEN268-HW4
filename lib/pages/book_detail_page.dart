import 'package:flutter/material.dart';
import '../data/books.dart';

class BookDetailPage extends StatelessWidget {
  final Book book;

  const BookDetailPage({super.key, required this.book});

  // hopefully no need to implement this per book type right?...
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          'Detail of the Book',
          style: TextStyle(color: Colors.grey, fontSize: 24),
          
        ),
      ),
    );
  }
}
