import 'package:flutter/material.dart';
import '../../app.dart';
import '../widgets/catalog_grid.dart';
import '../widgets/empty_state.dart';
import 'product_detail_screen.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CatalogScope.of(context);
    final favorites = controller.favoriteProducts;
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Mis favoritos', style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 6),
        Text('Guarda los productos que quieras consultar después.', style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(height: 20),
        Expanded(
          child: favorites.isEmpty
              ? const EmptyState(
                  title: 'Aún no tienes favoritos',
                  message: 'Toca el corazón de cualquier producto para guardarlo aquí.',
                  icon: Icons.favorite_border_rounded,
                )
              : CatalogGrid(
                  products: favorites,
                  isFavorite: controller.isFavorite,
                  onFavorite: controller.toggleFavorite,
                  onTap: (product) => Navigator.push(context, MaterialPageRoute(
                    builder: (_) => ProductDetailScreen(product: product),
                  )),
                ),
        ),
      ]),
    );
  }
}
