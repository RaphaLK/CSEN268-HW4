import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../data/books.dart';
import '../widgets/book_list_item.dart';

class ByAuthorPage extends StatelessWidget {
  const ByAuthorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final sorted = [...books]
      ..sort((a, b) => a.author.compareTo(b.author));

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
        ...sorted.map((b) => BookListItem(
          book: b,
          onTap: () => context.goNamed('byAuthorDetail', extra: b),
        )),
      ],
    );
  }
}
