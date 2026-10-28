import 'package:flutter/material.dart';
import '../../app.dart';
import '../widgets/app_bottom_nav.dart';
import 'about_screen.dart';
import 'catalog_screen.dart';
import 'favorites_screen.dart';
import 'home_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final controller = CatalogScope.of(context);
    final pages = [
      HomeScreen(onExplore: () => setState(() => selectedIndex = 1)),
      const CatalogScreen(),
      const FavoritesScreen(),
      const AboutScreen(),
    ];
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(index: selectedIndex, children: pages),
      ),
      bottomNavigationBar: AppBottomNav(
        index: selectedIndex,
        onChanged: (value) => setState(() => selectedIndex = value),
      ),
    );
  }
}
