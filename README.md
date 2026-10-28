# mega — Catálogo de productos en Flutter

**Práctica:** Arquitectura, Consumo de Datos y Flujo Colaborativo Git  
**Asignatura:** Desarrollo de Aplicaciones Móviles  
**Unidad:** 3 — Manejo de Estados, Arquitectura y Servicios  
**Integrante registrado:** Edgar Axel Sandoval Hernández

## 1. Objetivo general

Diseñar e implementar una aplicación móvil en Flutter que permita explorar un catálogo de productos a partir de datos estructurados en un archivo JSON local, con imágenes remotas, búsqueda, filtrado por categoría, favoritos y navegación entre pantallas. El proyecto aplica separación por capas y un flujo de trabajo colaborativo con Git.

## 2. Funcionalidades

- Inicio con productos destacados y estadísticas.
- Catálogo con búsqueda por nombre/categoría y filtros.
- Detalle del producto con descripción, precio, calificación y stock.
- Favoritos en memoria durante la sesión.
- Pantalla informativa del proyecto.
- Carga del JSON desde `assets/data/products.json`.
- Imágenes de red con indicador de carga y vista alternativa ante errores.
- Estados de carga, error y resultados vacíos.

> Los datos son de demostración. Los favoritos no persisten al cerrar la aplicación y la compra es simulada.

## 3. Arquitectura por capas

```text
lib/
├── main.dart
├── app.dart
├── core/theme/app_theme.dart
├── domain/models/product.dart
├── data/services/local_json_service.dart
├── data/repositories/product_repository.dart
└── presentation/
    ├── state/catalog_controller.dart
    ├── screens/
    └── widgets/
assets/data/products.json
```

- **Dominio:** `Product` define el modelo y valida los tipos de datos al mapear el JSON.
- **Datos:** `LocalJsonService` lee el archivo local; `ProductRepository` convierte las filas JSON en objetos `Product`.
- **Presentación:** las pantallas y widgets muestran los datos.
- **Estado:** `CatalogController` centraliza carga, búsqueda, filtros y favoritos mediante `ChangeNotifier`.
- **Tema:** `AppTheme` contiene la paleta y estilos compartidos.

## 4. Pantallas y navegación

1. Inicio.
2. Catálogo.
3. Detalle del producto (se abre mediante `Navigator.push`).
4. Favoritos.
5. Acerca de.

La navegación principal usa `NavigationBar`; el detalle utiliza navegación estándar de Flutter y permite regresar con la flecha del `AppBar` o `Navigator.pop`.

## 5. Widgets personalizados

Se incluyen más de diez componentes reutilizables:
`ProductImage`, `SectionHeading`, `SearchField`, `CategoryChip`, `PriceLabel`, `RatingBadge`, `FavoriteButton`, `ProductCard`, `EmptyState`, `FeaturedBanner`, `CatalogGrid`, `AppBottomNav` y `StatTile`.

## 6. Ejecutar en VS Code

Requisitos: Flutter SDK instalado y reconocido por PowerShell, Android Studio/emulador o Chrome.

Desde la carpeta que contiene `pubspec.yaml`:

```powershell
flutter --version
flutter doctor
flutter pub get
flutter analyze
flutter run
```

Para ver dispositivos:
```powershell
flutter devices
```

Para ejecutar en Chrome:
```powershell
flutter run -d chrome
```

Para ejecutar en un emulador Android, usa el identificador que aparezca en `flutter devices`, por ejemplo:
```powershell
flutter run -d emulator-5554
```

Si cambias `products.json`, confirma que siga siendo JSON válido. Si agregas otro archivo de datos, decláralo en `assets` dentro de `pubspec.yaml` y ejecuta `flutter pub get`.

## 7. Esquema del JSON

Cada elemento contiene:
- `id`: identificador de texto.
- `name`: nombre.
- `category`: categoría.
- `price`: precio numérico en MXN.
- `rating`: calificación numérica.
- `description`: descripción.
- `image`: URL remota.
- `stock`: existencia numérica.
- `featured`: indicador booleano.

El modelo realiza validación de campos requeridos; un tipo incorrecto genera un error que la interfaz comunica con una opción de reintento.

## 8. Flujo Git colaborativo

No trabajar directamente en `main`. Crear una rama por funcionalidad, confirmar cambios pequeños y abrir Pull Requests. Como el único integrante proporcionado es Edgar, antes de entregar la práctica registra al segundo integrante si aplica y coordinen commits reales desde cuentas/ramas distintas.

Ejemplo:
```bash
git init
git add .
git commit -m "chore: crear estructura inicial de mega"
git branch -M main
git remote add origin https://github.com/USUARIO/mega.git
git push -u origin main

git checkout -b feature/catalogo
# realizar cambios de catálogo
git add .
git commit -m "feat: agregar catálogo y filtros"
git push -u origin feature/catalogo
```

Después, en GitHub: **Compare & pull request → describir el cambio → solicitar revisión → revisar diferencias → Merge pull request**. El ejemplo del remoto debe reemplazarse por la URL real del repositorio.

## 9. Evidencia de los cinco conflictos reales

Los conflictos deben producirse y resolverse en Git; no se deben fingir ni declarar resueltos si no ocurrieron. La guía `docs/CONFLICTOS_GIT.md` incluye un procedimiento reproducible y una plantilla para registrar los resultados reales. Guarden capturas de la terminal con `CONFLICT`, la resolución, `git status` y el commit final, además de enlaces a los PR.

## 10. Lista de revisión antes de entregar

- [ ] `flutter pub get` termina correctamente.
- [ ] `flutter analyze` revisado; resolver errores y advertencias relevantes.
- [ ] Aplicación probada en el dispositivo elegido.
- [ ] Verificar conectividad para las imágenes remotas.
- [ ] Probar búsqueda, filtros, favoritos, detalle y navegación atrás.
- [ ] Crear repositorio público y configurar ramas.
- [ ] Abrir y fusionar PR documentados.
- [ ] Documentar cinco conflictos reales y sus resoluciones.
- [ ] Adjuntar reporte de práctica y capturas.
- [ ] Cada integrante puede explicar modelo, servicio JSON, repositorio, estado, widgets y flujo Git.
