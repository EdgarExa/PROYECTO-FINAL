import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'data/repositories/product_repository.dart';
import 'presentation/state/catalog_controller.dart';
import 'presentation/screens/main_navigation_screen.dart';

class MegaApp extends StatefulWidget {
  const MegaApp({super.key});

  @override
  State<MegaApp> createState() => _MegaAppState();
}

class _MegaAppState extends State<MegaApp> {
  late final CatalogController controller;

  @override
  void initState() {
    super.initState();
    controller = CatalogController(ProductRepository())..loadProducts();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CatalogScope(
      controller: controller,
      child: MaterialApp(
        title: 'mega | Catálogo',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        home: const MainNavigationScreen(),
      ),
    );
  }
}

class CatalogScope extends InheritedNotifier<CatalogController> {
  const CatalogScope({
    super.key,
    required CatalogController controller,
    required super.child,
  }) : super(notifier: controller);

  static CatalogController of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<CatalogScope>();
    assert(scope != null, 'CatalogScope no encontrado en el árbol de widgets.');
    return scope!.notifier!;
  }
}
