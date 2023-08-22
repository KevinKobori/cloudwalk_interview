import 'package:faker/faker.dart' as fk;
import 'package:flutter_test/flutter_test.dart' as ft;
import 'package:mocktail/mocktail.dart' as mt;

export 'core/core.dart';

class ApodTest {
  static ApodTest? _instance;
  static ApodTest get instance => _instance!;
  static set instance(ApodTest instance) => _instance = instance;

  /// faker
  static fk.Faker get faker => fk.Faker.withGenerator(fk.random);

  /// mocktail
  static mt.VerificationResult verify(Future<void> Function() body) => mt.verify(() => body.call());

  /// flutter_test
  static void setUp(Future<void> Function() body) => ft.setUp(() => body.call());
  static void setUpAll(Future<void> Function() body) => ft.setUpAll(() => body.call());
  static void test(String description, Future<void> Function() body) => ft.test(description,() => body.call());
  static void testWidgets(String description, Future<void> Function(ft.WidgetTester tester) body) => 
  ft.testWidgets(description, (ft.WidgetTester tester) async => await body.call(tester));
}
