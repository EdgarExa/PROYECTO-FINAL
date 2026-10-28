import 'package:flutter/foundation.dart';
import '../../data/repositories/product_repository.dart';
import '../../domain/models/product.dart';

class CatalogController extends ChangeNotifier {
  CatalogController(this._repository);

  final ProductRepository _repository;
  List<Product> _products = const [];
  final Set<String> _favoriteIds = {};
  bool _isLoading = false;
  String? _error;
  String _query = '';
  String _category = 'Todos';

  List<Product> get products => List.unmodifiable(_products);
  bool get isLoading => _isLoading;
  String? get error => _error;
  String get query => _query;
  String get category => _category;
  Set<String> get favoriteIds => Set.unmodifiable(_favoriteIds);
  int get favoritesCount => _favoriteIds.length;

  List<String> get categories {
    final values = _products.map((p) => p.category).toSet().toList()..sort();
    return ['Todos', ...values];
  }

  List<Product> get visibleProducts {
    final q = _query.trim().toLowerCase();
    return _products.where((product) {
      final matchesQuery = q.isEmpty ||
          product.name.toLowerCase().contains(q) ||
          product.category.toLowerCase().contains(q);
      final matchesCategory = _category == 'Todos' || product.category == _category;
      return matchesQuery && matchesCategory;
    }).toList(growable: false);
  }

  List<Product> get favoriteProducts =>
      _products.where((p) => _favoriteIds.contains(p.id)).toList(growable: false);

  List<Product> get featuredProducts =>
      _products.where((p) => p.featured).toList(growable: false);

  Future<void> loadProducts() async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    try {
      _products = await _repository.getProducts();
    } catch (error) {
      _error = 'No fue posible leer el catálogo. Verifica el archivo JSON. Detalle: $error';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void search(String value) {
    _query = value;
    notifyListeners();
  }

  void selectCategory(String value) {
    _category = value;
    notifyListeners();
  }

  void toggleFavorite(Product product) {
    if (!_favoriteIds.add(product.id)) _favoriteIds.remove(product.id);
    notifyListeners();
  }

  bool isFavorite(Product product) => _favoriteIds.contains(product.id);
}
