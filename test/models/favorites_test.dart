import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_web/models/favorites.dart';

void main() {
  group('Testing App Provider', () {
    var favorites = Favorites();

    test('A new item should be added', () {
      var number = 35;
      favorites.add(number);
      expect(favorites.items.contains(number), true);
    });
  });
}
