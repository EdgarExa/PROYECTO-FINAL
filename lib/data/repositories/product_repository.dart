import '../../domain/models/product.dart';
import '../services/local_json_service.dart';

class ProductRepository {
  ProductRepository({LocalJsonService? service})
      : _service = service ?? LocalJsonService();

  final LocalJsonService _service;

  Future<List<Product>> getProducts() async {
    final rows = await _service.readProducts();
    return rows.map(Product.fromJson).toList(growable: false);
  }
}
