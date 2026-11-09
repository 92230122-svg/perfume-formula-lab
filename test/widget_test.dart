import 'package:flutter_test/flutter_test.dart';
import 'package:perfume_formula_lab/main.dart';

void main() {
  testWidgets('Perfume Calculator loads correctly', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const PerfumeCalculatorApp());

    expect(find.text('PERFUME FORMULA'), findsOneWidget);
    expect(find.text('CALCULATE FORMULA'), findsOneWidget);
    expect(find.text('Bottle Size'), findsOneWidget);
  });
}
