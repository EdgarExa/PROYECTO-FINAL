import 'package:flutter_test/flutter_test.dart';
import 'package:mega/app.dart';

void main() {
  testWidgets('mega muestra la navegación principal', (tester) async {
    await tester.pumpWidget(const MegaApp());
    await tester.pumpAndSettle();

    expect(find.text('Inicio'), findsOneWidget);
    expect(find.text('Catálogo'), findsOneWidget);
    expect(find.text('Favoritos'), findsNWidgets(2));
    expect(find.text('Acerca de'), findsOneWidget);
  });
}