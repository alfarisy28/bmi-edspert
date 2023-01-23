// ignore_for_file: unnecessary_import

import 'package:bmi/views/bmi_data_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("Bmi Data Screen Test widget", (tester) async {
    tester.binding.window.physicalSizeTestValue = const Size(1200, 2200);
    await tester.pumpWidget(const DataScreenTest());

    final findMaleIcon = find.byIcon(Icons.male);
    final findFemaleText = find.text("Female");
    final findChecksIcon = find.byIcon(Icons.check_circle);

    expect(findMaleIcon, findsOneWidget);
    expect(findFemaleText, findsOneWidget);
    expect(findChecksIcon, findsNWidgets(2));

    final findHasilByText = find.text("Hasil Perhitungan");
    expect(findHasilByText, findsNothing);

    final findHitung = find.text("HITUNG BMI");
    expect(findHitung, findsOneWidget);
    await tester.tap(findHitung);
    await tester.pumpAndSettle(const Duration(seconds: 1));

    expect(findMaleIcon, findsNothing);
    // sudah pindah halaman

    final findHasilByKey = find.byKey(const Key("calculate"));
    expect(findHasilByText, findsOneWidget);
    expect(findHasilByKey, findsOneWidget);
  });
}

class DataScreenTest extends StatelessWidget {
  const DataScreenTest({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BmiDataScreen(),
    );
  }
}
