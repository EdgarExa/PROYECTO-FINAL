# Reto de los cinco conflictos de merge — mega

## Aviso

Este documento es un procedimiento y una plantilla de evidencia, no una afirmación de que los conflictos ya ocurrieron. Para obtener crédito, dos ramas deben editar realmente las mismas líneas y Git debe detectar la colisión. No se recomienda provocar conflictos en `main` ni usar cambios artificiales que rompan el proyecto.

## Preparación

Trabajen en una copia del repositorio. Asegúrense de que la rama base esté actualizada y de que ambos cambios partan del mismo commit.

```bash
git switch main
git pull
git switch -c feature/conflicto-1-a
```

En paralelo, la segunda persona debe crear `feature/conflicto-1-b` desde el mismo commit. Ambas ramas modifican deliberadamente la misma línea en el archivo acordado, con valores diferentes y cambios válidos. Cada integrante confirma sus cambios y los sube.

Para demostrar el conflicto de manera controlada, en una rama integra primero el cambio de la otra y luego intenta integrar su propia rama. Git debe mostrar un conflicto real. No continúen hasta registrar la evidencia.

```bash
git merge feature/conflicto-1-b
git status
```

Cuando aparezcan marcadores `<<<<<<<`, `=======` y `>>>>>>>`, editen el archivo para conservar una solución coherente. Después:

```bash
git add RUTA/DEL/ARCHIVO
git commit -m "fix: resolver conflicto de merge 1"
git status
```

Ejecuten `flutter analyze` y prueben la aplicación. Abran/actualicen el PR y documenten la resolución. Repitan el ejercicio con cinco conflictos diferentes.

## Ideas de archivos compartidos

Elegir cambios pequeños que no dañen la lógica y que se puedan probar:

1. `lib/core/theme/app_theme.dart`: dos cambios válidos en el mismo valor de estilo.
2. `lib/presentation/widgets/featured_banner.dart`: dos cambios en el mismo texto del banner.
3. `lib/presentation/widgets/section_heading.dart`: cambios compatibles en el texto o estilo de título.
4. `README.md`: dos ediciones de la misma línea de documentación.
5. `lib/presentation/screens/about_screen.dart`: dos cambios compatibles en el texto descriptivo.

En cada caso, ambas ramas deben editar la misma región desde el mismo ancestro común. Un conflicto solo cuenta si Git realmente lo detecta.

## Registro de evidencia

Completar una fila después de resolver cada conflicto real.

| N.º | Archivo y líneas | Ramas implicadas | Causa del conflicto | Solución acordada | Commit de resolución | PR/captura |
|---|---|---|---|---|---|---|
| 1 | Pendiente | Pendiente | Pendiente | Pendiente | Pendiente | Pendiente |
| 2 | Pendiente | Pendiente | Pendiente | Pendiente | Pendiente | Pendiente |
| 3 | Pendiente | Pendiente | Pendiente | Pendiente | Pendiente | Pendiente |
| 4 | Pendiente | Pendiente | Pendiente | Pendiente | Pendiente | Pendiente |
| 5 | Pendiente | Pendiente | Pendiente | Pendiente | Pendiente | Pendiente |

## Capturas recomendadas por conflicto

1. Los commits de las dos ramas antes de la fusión.
2. Terminal o GitHub mostrando el conflicto real.
3. Archivo resuelto y `git status`.
4. Commit que registra la resolución.
5. PR y resultado de pruebas (`flutter analyze` y ejecución).

## Reglas

- No registrar un conflicto que no se haya producido.
- No sobrescribir el trabajo de la otra persona sin discutir la solución.
- No hacer commits directos a `main`.
- Mantener la aplicación compilable después de cada resolución.
