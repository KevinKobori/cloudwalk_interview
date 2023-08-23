import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});

  group('load', () {
    test('Should call cacheStorage with correct key', () async {});

    test('Should throw UnexpectedError if cache is empty', () async {});

    test('Should throw UnexpectedError if cache is isvalid', () async {});

    test('Should throw UnexpectedError if cache is incomplete', () async {});

    test('Should throw UnexpectedError if cache throws', () async {});
  });

  group('validate', () {
    test('Should call cacheStorage with correct key', () async {});

    test('Should delete cache if it is invalid', () async {});

    test('Should delete cache if it is incomplete', () async {});

    test('Should delete cache if fetch fails', () async {});
  });

  group('save', () {
    test('Should call cacheStorage with correct values', () async {});

    test('Should throw UnexpectedError if save throws', () async {});
  });
}
