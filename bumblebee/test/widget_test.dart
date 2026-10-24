import 'package:flutter_test/flutter_test.dart';

import 'package:bumblebee/main.dart';

void main() {
  testWidgets('App renders start screen test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text("Bumblee: Car Rental App"), findsOneWidget);
    expect(find.text("Rent your car with ease"), findsOneWidget);
    expect(find.text("Get Started"), findsOneWidget);
  });
}
