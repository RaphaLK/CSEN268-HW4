import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainPage extends StatelessWidget {
  final GoRouterState state;
  final Widget child;

  const MainPage({super.key, required this.state, required this.child});

  int get _selectedIndex {
    final path = state.uri.path;
    if (path.startsWith('/byAuthor')) return 0;
    if (path.startsWith('/byTitle')) return 1;
    return 2;
  }

  String get _title {
    if (state.uri.path.startsWith('/profile')) return 'Profile';
    return 'Books';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          switch (index) {
            case 0:
              context.go('/byAuthor');
              break;
            case 1:
              context.go('/byTitle');
              break;
            case 2:
              context.go('/profile');
              break;
          }
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'By Author',
          ),
          NavigationDestination(
            icon: Icon(Icons.title),
            selectedIcon: Icon(Icons.title),
            label: 'By Title',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
