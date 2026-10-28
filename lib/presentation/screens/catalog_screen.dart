import 'package:flutter/material.dart';
import '../../app.dart';
import '../widgets/catalog_grid.dart';
import '../widgets/category_chip.dart';
import '../widgets/empty_state.dart';
import '../widgets/search_field.dart';
import 'product_detail_screen.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CatalogScope.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Catálogo', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 6),
          Text('Explora todos los productos disponibles.', style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 18),
          SearchField(onChanged: controller.search, initialValue: controller.query),
          const SizedBox(height: 12),
          SizedBox(
            height: 42,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: controller.categories.map((category) => CategoryChip(
                label: category,
                selected: controller.category == category,
                onTap: () => controller.selectCategory(category),
              )).toList(),
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: controller.isLoading
                ? const Center(child: CircularProgressIndicator())
                : controller.error != null
                    ? EmptyState(title: 'No se pudo cargar', message: controller.error!, actionLabel: 'Reintentar', onAction: controller.loadProducts, icon: Icons.error_outline)
                    : controller.visibleProducts.isEmpty
                        ? const EmptyState(title: 'Sin resultados', message: 'Prueba con otra búsqueda o categoría.', icon: Icons.search_off_rounded)
                        : CatalogGrid(
                            products: controller.visibleProducts,
                            isFavorite: controller.isFavorite,
                            onFavorite: controller.toggleFavorite,
                            onTap: (product) => Navigator.push(context, MaterialPageRoute(
                              builder: (_) => ProductDetailScreen(product: product),
                            )),
                          ),
          ),
        ],
      ),
    );
  }
}
