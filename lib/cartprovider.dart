import 'package:flutter/foundation.dart';
import 'sabadkharid.dart'; // جایی که کلاس CartItem تعریف شده

class CartProvider extends ChangeNotifier {
  List<CartItem> _cartItems = [];
  List<CartItem> _purchasedItems = []; // لیست کالاهای خریداری شده

  List<CartItem> get cartItems => _cartItems;
  List<CartItem> get purchasedItems => _purchasedItems; // دریافت لیست کالاهای خریداری شده

  void addItem(CartItem item) {
    final existingItemIndex = _cartItems.indexWhere((i) => i.id == item.id);
    if (existingItemIndex >= 0) {
      _cartItems[existingItemIndex].quantity += item.quantity;
    } else {
      _cartItems.add(item);
    }
    notifyListeners(); // اطلاع به ویجت‌ها برای بازسازی
  }

  void removeItem(String id) {
    _cartItems.removeWhere((item) => item.id == id);
    notifyListeners();
  }

  void updateItemQuantity(String id, int quantity) {
    final index = _cartItems.indexWhere((item) => item.id == id);
    if (index != -1) {
      _cartItems[index].quantity += quantity;

      // اگر تعداد به صفر یا کمتر برسد، محصول از سبد خرید حذف می‌شود
      if (_cartItems[index].quantity <= 0) {
        _cartItems.removeAt(index);
      }

      notifyListeners();
    }
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  // اضافه کردن کالاها به لیست خریداری‌شده و پاک کردن سبد خرید
  void checkout() {
    _purchasedItems.addAll(_cartItems); // انتقال کالاها به لیست خریداری‌شده
    _cartItems.clear(); // پاک کردن سبد خرید
    notifyListeners();
  }
}