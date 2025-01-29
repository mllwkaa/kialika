import 'package:flutter/foundation.dart';
import 'sabadkharid.dart'; // جایی که کلاس CartItem تعریف شده

class FavoriteProvider extends ChangeNotifier {
  final List<CartItem> _favoriteItems = [];

  List<CartItem> get favoriteItems => _favoriteItems;

  void addToFavorites(CartItem item) {
    if (!_favoriteItems.any((element) => element.id == item.id)) {
      _favoriteItems.add(item);
      notifyListeners(); // اطلاع به ویجت‌ها برای بازسازی
    }
  }

  void removeFromFavorites(String id) {
    _favoriteItems.removeWhere((item) => item.id == id);
    notifyListeners();
  }

  bool isFavorite(String id) {
    return _favoriteItems.any((item) => item.id == id);
  }
}
