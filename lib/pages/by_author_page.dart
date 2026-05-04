import 'package:flutter/material.dart';

class ByAuthorPage extends StatelessWidget {
  const ByAuthorPage({super.key});

  static const _books = [
    ('Da Vinci Code', 'Dan Brown'),
    ('Da Vinci Code', 'Dan Brown'),
    ('Da Vinci Code', 'Dan Brown'),
    ('Da Vinci Code', 'Dan Brown'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            'Sorted by Author',
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        ..._books.map((b) => _BookListItem(title: b.$1, author: b.$2)),
      ],
    );
  }
}

class _BookListItem extends StatelessWidget {
  final String title;
  final String author;

  const _BookListItem({required this.title, required this.author});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(height: 2),
          Text(
            author,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
