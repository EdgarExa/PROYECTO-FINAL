import 'package:flutter/material.dart';
import '../../app.dart';
import '../../domain/models/product.dart';
import '../widgets/favorite_button.dart';
import '../widgets/price_label.dart';
import '../widgets/product_image.dart';
import '../widgets/rating_badge.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final controller = CatalogScope.of(context);
    final favorite = controller.isFavorite(product);
    return Scaffold(
      appBar: AppBar(title: const Text('Detalle del producto')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ProductImage(url: product.image, height: 310, width: double.infinity, borderRadius: 24),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(child: Text(product.category.toUpperCase(), style: Theme.of(context).textTheme.bodySmall)),
              RatingBadge(rating: product.rating),
            ],
          ),
          const SizedBox(height: 8),
          Text(product.name, style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 12),
          PriceLabel(price: product.price, large: true),
          const SizedBox(height: 18),
          Text('Descripción', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          Text(product.description, style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 18),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18)),
            child: Row(children: [
              const Icon(Icons.inventory_2_outlined, color: Color(0xFF496A81)),
              const SizedBox(width: 10),
              Expanded(child: Text(product.stock > 0 ? 'Disponibles: ${product.stock} unidades' : 'Agotado')),
              FavoriteButton(isFavorite: favorite, onPressed: () => controller.toggleFavorite(product)),
            ]),
          ),
          const SizedBox(height: 20),
          FilledButton.icon(
            onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Demostración académica: no se procesa una compra real.')),
            ),
            icon: const Icon(Icons.shopping_bag_outlined),
            label: const Text('Simular compra'),
          ),
        ],
      ),
    );
  }
}
