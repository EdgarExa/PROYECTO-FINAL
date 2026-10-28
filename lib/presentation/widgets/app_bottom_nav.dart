import 'package:flutter/material.dart';

class AppBottomNav extends StatelessWidget {
  const AppBottomNav({super.key, required this.index, required this.onChanged});

  final int index;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: index,
      onDestinationSelected: onChanged,
      destinations: const [
        NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home_rounded), label: 'Inicio'),
        NavigationDestination(icon: Icon(Icons.grid_view_rounded), label: 'Catálogo'),
        NavigationDestination(icon: Icon(Icons.favorite_border_rounded), label: 'Favoritos'),
        NavigationDestination(icon: Icon(Icons.info_outline_rounded), label: 'Acerca de'),
      ],
    );
  }
}
