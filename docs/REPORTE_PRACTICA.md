# Reporte de práctica de laboratorio

## Portada

- **Institución:** Instituto Tecnológico de Tlaxiaco — TecNM
- **Carrera:** Ingeniería en Sistemas Computacionales
- **Asignatura:** Desarrollo de Aplicaciones Móviles
- **Unidad:** 3 — Manejo de Estados, Arquitectura y Servicios
- **Práctica:** Arquitectura, Consumo de Datos y Flujo Colaborativo Git
- **Proyecto:** mega — Catálogo de productos
- **Integrante registrado:** Edgar Axel Sandoval Hernández
- **Fecha:** __________________
- **Docente:** __________________

## 1. Objetivo general

Desarrollar una aplicación de catálogo de productos en Flutter que organice el código por capas, cargue datos desde un archivo JSON local, muestre imágenes remotas, permita navegar entre distintas pantallas y administre el estado de búsqueda, filtros y favoritos. También se busca practicar el trabajo colaborativo con ramas, Pull Requests y resolución documentada de conflictos en Git.

## 2. Introducción

La separación de responsabilidades facilita el mantenimiento de una aplicación móvil. En este proyecto, los datos del catálogo se guardan en un archivo JSON y se transforman en objetos Dart mediante un modelo. Un servicio lee el recurso local, un repositorio entrega los objetos a la aplicación y un controlador administra el estado que consumen las pantallas. Esta estructura permite distinguir la lógica de datos de la interfaz gráfica y reutilizar componentes en diferentes vistas.

## 3. Herramientas y materiales

- Flutter SDK y Dart.
- Visual Studio Code.
- Android Studio/emulador o navegador compatible.
- Git y cuenta de GitHub.
- Archivo JSON local e imágenes disponibles mediante URL.
- Computadora con acceso a Internet para descargar imágenes y sincronizar el repositorio.

## 4. Marco teórico

### Flutter

Flutter es un framework para crear interfaces multiplataforma con Dart. La interfaz se construye con widgets que pueden combinarse y reutilizarse.

### JSON y mapeo

JSON es un formato de intercambio de datos. La aplicación lee `assets/data/products.json`, decodifica el contenido y mapea cada objeto a una instancia de `Product`. La validación de tipos ayuda a detectar datos mal formados.

### Arquitectura por capas

La capa de dominio define el modelo; la de datos se encarga de leer y transformar los datos; la presentación contiene las pantallas y widgets. Esta separación reduce el acoplamiento y facilita las pruebas y el mantenimiento.

### Manejo de estado

`CatalogController`, basado en `ChangeNotifier`, mantiene productos, búsqueda, categoría seleccionada y favoritos. Cuando cambia el estado, las pantallas que escuchan al controlador se reconstruyen.

### Git y Pull Requests

Git registra versiones del código y permite desarrollar en ramas. Los Pull Requests sirven para revisar cambios antes de fusionarlos. Los conflictos se presentan cuando Git no puede combinar automáticamente modificaciones incompatibles sobre una misma región.

## 5. Desarrollo

1. Se creó el proyecto Flutter y se definieron dependencias y recursos en `pubspec.yaml`.
2. Se estructuró el código en dominio, datos, presentación y tema.
3. Se definió el modelo `Product` con sus campos y validaciones.
4. Se creó el archivo JSON con diez productos y URL de imágenes.
5. Se implementó el servicio local, repositorio y controlador de estado.
6. Se construyeron las vistas de inicio, catálogo, detalle, favoritos y acerca de.
7. Se extrajeron componentes reutilizables para imágenes, tarjetas, precios, calificaciones, búsqueda, filtros y estados vacíos.
8. Se documentó el procedimiento Git para ramas, PR y cinco conflictos reales.

## 6. Pruebas realizadas

Completar con los resultados reales después de ejecutar la aplicación.

| Prueba | Resultado | Evidencia |
|---|---|---|
| `flutter pub get` | Pendiente de ejecutar | Captura de terminal |
| `flutter analyze` | Pendiente de ejecutar | Captura de terminal |
| Carga del JSON local | Pendiente de verificar | Captura del catálogo |
| Carga y error de imágenes | Pendiente de verificar | Captura |
| Búsqueda y categorías | Pendiente de verificar | Captura |
| Agregar/quitar favoritos | Pendiente de verificar | Captura |
| Abrir detalle y regresar | Pendiente de verificar | Captura |
| Cinco conflictos reales | Pendiente de realizar | Tabla y capturas Git |

## 7. Resultados y observaciones

La aplicación está diseñada para presentar un catálogo de demostración sin depender de una API remota. Los datos se obtienen de un recurso JSON incluido en el proyecto; las imágenes sí requieren conectividad. Los favoritos se mantienen solo durante la sesión, porque no se incorporó almacenamiento persistente ni base de datos.

## 8. Conclusión

La práctica integra el diseño de una interfaz en Flutter con lectura de JSON, mapeo a modelos, separación por capas y manejo de estado. La reutilización de widgets facilita conservar un estilo uniforme y evita duplicar código. El flujo de Git complementa el desarrollo técnico al promover revisión de cambios y resolución colaborativa de conflictos. Antes de entregar, es necesario ejecutar las pruebas, incorporar capturas reales y completar la evidencia de los cinco conflictos.

## 9. Referencias

- Flutter. (s. f.). *Flutter documentation*. https://docs.flutter.dev/
- Dart. (s. f.). *Dart language documentation*. https://dart.dev/guides
- Git. (s. f.). *Git documentation*. https://git-scm.com/doc
- GitHub Docs. (s. f.). *About pull requests*. https://docs.github.com/en/pull-requests
