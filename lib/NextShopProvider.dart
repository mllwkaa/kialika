import 'package:flutter/foundation.dart';
import 'sabadkharid.dart'; // جایی که کلاس CartItem تعریف شده

class NextShopProvider extends ChangeNotifier {
  List<CartItem> _nextShopItems = [];

  List<CartItem> get nextShopItems => _nextShopItems;

  void addToNextShop(CartItem item) {
    _nextShopItems.add(item);
    notifyListeners(); // اطلاع به ویجت‌ها برای بازسازی
  }

  void removeFromNextShop(String id) {
    _nextShopItems.removeWhere((item) => item.id == id);
    notifyListeners();
  }

  bool isInNextShop(String id) {
    return _nextShopItems.any((item) => item.id == id);
  }
}