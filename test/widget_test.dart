import 'package:flutter_test/flutter_test.dart';
import 'package:lifeos/app/app.dart';

void main() {
  testWidgets('LifeOS launches successfully', (WidgetTester tester) async {
    await tester.pumpWidget(const LifeOSApp());

    expect(find.text('Welcome to LifeOS'), findsOneWidget);
  });
}