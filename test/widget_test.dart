import 'package:flutter_test/flutter_test.dart';
import 'package:tool_text/main.dart';

void main() {
  testWidgets('App launches successfully', (WidgetTester tester) async {
    await tester.pumpWidget(const SmartTextToolsApp());
    expect(find.text('Smart Text Tools'), findsOneWidget);
  });
}
