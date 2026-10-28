import 'package:flutter/material.dart';
import '../../app.dart';
import '../widgets/stat_tile.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CatalogScope.of(context);
    return ListView(
      padding: const EdgeInsets.all(22),
      children: [
        Container(
          height: 100,
          decoration: BoxDecoration(color: const Color(0xFFDCE9E8), borderRadius: BorderRadius.circular(24)),
          child: const Icon(Icons.shopping_bag_rounded, size: 48, color: Color(0xFF496A81)),
        ),
        const SizedBox(height: 22),
        Text('Acerca de mega', style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 10),
        const Text(
          'mega es una aplicación académica de catálogo de productos desarrollada con Flutter. '
          'Los productos se leen desde un archivo JSON local y sus fotografías se cargan desde direcciones web.',
        ),
        const SizedBox(height: 22),
        Row(children: [
          StatTile(value: '${controller.products.length}', label: 'Productos', icon: Icons.inventory_2_outlined),
          const SizedBox(width: 10),
          StatTile(value: '${controller.categories.length - 1}', label: 'Categorías', icon: Icons.category_outlined),
        ]),
        const SizedBox(height: 24),
        Text('Ficha del proyecto', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        const _InfoRow(label: 'Asignatura', value: 'Desarrollo de Aplicaciones Móviles'),
        const _InfoRow(label: 'Unidad', value: 'Unidad 3: Manejo de Estados, Arquitectura y Servicios'),
        const _InfoRow(label: 'Arquitectura', value: 'Capas: presentación, dominio y datos'),
        const _InfoRow(label: 'Integrante', value: 'Edgar Axel Sandoval Hernández'),
        const _InfoRow(label: 'Fuente de datos', value: 'assets/data/products.json'),
        const SizedBox(height: 18),
        const Text('Proyecto demostrativo: no realiza ventas ni pagos reales.', style: TextStyle(color: Color(0xFF66758A))),
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(width: 112, child: Text(label, style: const TextStyle(fontWeight: FontWeight.w700))),
        Expanded(child: Text(value)),
      ]),
    );
  }
}
