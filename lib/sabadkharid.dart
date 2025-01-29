import 'package:flutter/material.dart';
import 'package:kialika/userProfile.dart';
import 'package:provider/provider.dart'; // اضافه کردن کتابخانه Provider
import 'cartprovider.dart'; // وارد کردن CartProvider
import 'category.dart';
import 'home.dart';
import 'pardakht.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class CartItem {
  final String id;
  final String name;
  final String imageUrl;
  final double price;
  final double? discountedPrice; // اختیاری (nullable)
  int quantity;

  CartItem({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    this.discountedPrice, // اختیاری (nullable)
    this.quantity = 1,
  });
}

class _CartPageState extends State<CartPage> {
  String address = '';
  TextEditingController addressController = TextEditingController();

  // تابع برای باز کردن دیالوگ افزودن آدرس
  void _addAddress() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Add Your Address"),
          content: TextField(
            controller: addressController,
            decoration: InputDecoration(hintText: "Enter your address here"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // بستن دیالوگ بدون ذخیره
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  address = addressController.text; // ذخیره آدرس
                });
                Navigator.pop(context); // بستن دیالوگ
              },
              child: Text("Save"),
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    // محاسبه قیمت کل سبد خرید
    double totalPrice = cartProvider.cartItems.fold(0.0, (sum, item) => sum + ((item.discountedPrice ?? item.price) * item.quantity));

    // هزینه حمل و نقل (فرضی)
    double shippingCost = 10.0;

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        title: const Text("Shopping Cart", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.pink[200],
      ),
      body: cartProvider.cartItems.isEmpty
          ? Center(
        child: Text(
          "Your shopping cart is empty",
          style: TextStyle(fontSize: 18),
        ),
      )
          : Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // لیست محصولات در سبد خرید
            Expanded(
              child: ListView.builder(
                itemCount: cartProvider.cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartProvider.cartItems[index];
                  return Card(
                    color: Colors.pink[100],
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: Image.asset(item.imageUrl, width: 60, height: 60),
                      title: Text(item.name),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Price: \$${(item.discountedPrice ?? item.price).toStringAsFixed(2)}',
                            style: TextStyle(color: Colors.green),
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove),
                                onPressed: () {
                                  cartProvider.updateItemQuantity(item.id, -1);
                                },
                              ),
                              Text(item.quantity.toString()),
                              IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () {
                                  cartProvider.updateItemQuantity(item.id, 1);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          cartProvider.removeItem(item.id);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),

            // بخش آدرس
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    address.isEmpty
                        ? "No address added"
                        : "Address: $address",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _addAddress, // باز کردن دیالوگ برای افزودن آدرس
                    child: Text("Add Address"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink[200],
                      padding: EdgeInsets.symmetric(vertical: 16),
                      textStyle: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),

            // بخش هزینه‌ها
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Subtotal:'),
                      Text('\$${totalPrice.toStringAsFixed(2)}'),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Shipping Cost:'),
                      Text('\$${shippingCost.toStringAsFixed(2)}'),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total:',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '\$${(totalPrice + shippingCost).toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // دکمه پرداخت
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  if (address.isEmpty) {
                    // اگر آدرس خالی باشد، پیام خطا نمایش داده می‌شود
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please add an address!")),
                    );
                  } else {
                    // هدایت به صفحه پرداخت
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentPage(
                          paymentAmount: totalPrice + shippingCost,
                          address: address,
                        ),
                      ),
                    );
                  }
                },
                child: Text(
                  "Checkout",
                  style: TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink[200],
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.pink[200],
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_sharp), label: 'ShoppingCart'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (index) {
          if (index == 0) Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
          if (index == 1) Navigator.push(context, MaterialPageRoute(builder: (context) => category()));
          if (index == 2) Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));
          if (index == 3) Navigator.push(context, MaterialPageRoute(builder: (context) => const userProfile()));
        },
      ),
    );
  }
}
