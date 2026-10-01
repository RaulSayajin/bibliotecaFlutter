import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:bank/main.dart';

void main() {
  testWidgets('Registra uma nova multa e exibe na lista', (tester) async {
    await tester.pumpWidget(const BibliotecaApp());

    expect(find.text('Multas da Biblioteca'), findsOneWidget);
    expect(find.byType(Card), findsNWidgets(2));

    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField).at(0), '202499');
    await tester.enterText(find.byType(TextField).at(1), '7,30');
    await tester.tap(find.text('Registrar'));
    await tester.pumpAndSettle();

    // O novo item só aparece depois do atraso de 1 segundo.
    expect(find.text('Matrícula: 202499'), findsNothing);
    await tester.pump(const Duration(seconds: 1));
    expect(find.text('Matrícula: 202499'), findsOneWidget);
    expect(find.textContaining('7,30'), findsOneWidget);
  });
}
