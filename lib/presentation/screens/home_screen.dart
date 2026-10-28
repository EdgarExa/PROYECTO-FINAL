import 'package:flutter/material.dart';
import '../../app.dart';
import '../widgets/catalog_grid.dart';
import '../widgets/featured_banner.dart';
import '../widgets/section_heading.dart';
import '../widgets/stat_tile.dart';
import 'product_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.onExplore});

  final VoidCallback onExplore;

  @override
  Widget build(BuildContext context) {
    final controller = CatalogScope.of(context);
    if (controller.isLoading) return const Center(child: CircularProgressIndicator());
    if (controller.error != null) {
      return Center(child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const Icon(Icons.error_outline, size: 48),
          const SizedBox(height: 12),
          Text(controller.error!, textAlign: TextAlign.center),
          const SizedBox(height: 12),
          FilledButton(onPressed: controller.loadProducts, child: const Text('Reintentar')),
        ]),
      ));
    }
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 20),
      children: [
        Row(children: [
          Container(
            width: 46, height: 46,
            decoration: BoxDecoration(color: const Color(0xFFDCE9E8), borderRadius: BorderRadius.circular(15)),
            child: const Icon(Icons.shopping_bag_outlined, color: Color(0xFF496A81)),
          ),
          const SizedBox(width: 12),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Hola, bienvenido', style: Theme.of(context).textTheme.bodySmall),
            Text('mega', style: Theme.of(context).textTheme.titleLarge),
          ])),
          IconButton(onPressed: onExplore, icon: const Icon(Icons.search_rounded), tooltip: 'Buscar productos'),
        ]),
        const SizedBox(height: 22),
        FeaturedBanner(onExplore: onExplore),
        const SizedBox(height: 22),
        Row(children: [
          StatTile(value: '${controller.products.length}', label: 'Productos', icon: Icons.inventory_2_outlined),
          const SizedBox(width: 10),
          StatTile(value: '${controller.categories.length - 1}', label: 'Categorías', icon: Icons.category_outlined),
          const SizedBox(width: 10),
          StatTile(value: '${controller.favoritesCount}', label: 'Favoritos', icon: Icons.favorite_border_rounded),
        ]),
        const SizedBox(height: 24),
        SectionHeading(title: 'Selección destacada', actionLabel: 'Ver todo', onAction: onExplore),
        const SizedBox(height: 12),
        SizedBox(
          height: 270,
          child: CatalogGrid(
            products: controller.featuredProducts.take(4).toList(),
            isFavorite: controller.isFavorite,
            onFavorite: controller.toggleFavorite,
            onTap: (product) => Navigator.push(context, MaterialPageRoute(
              builder: (_) => ProductDetailScreen(product: product),
            )),
          ),
        ),
      ],
    );
  }
}
