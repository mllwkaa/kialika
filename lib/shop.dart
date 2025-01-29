import 'package:flutter/material.dart';
import 'package:kialika/userprofile.dart';
import 'package:provider/provider.dart';
import 'cartprovider.dart';

class shop extends StatelessWidget {
  const shop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.pinkAccent),
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.pinkAccent),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => userProfile()),
            );
          },
        ),
        centerTitle: true,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.shopping_cart_rounded, color: Colors.pinkAccent),
            SizedBox(width: 8),
            Text(
              "My purchases",
              style: TextStyle(color: Colors.pinkAccent),
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.pink[100],
        child: cartProvider.purchasedItems.isEmpty
            ? Center(
          child: Text(
            "No products have been purchased yet",
            style: TextStyle(fontSize: 18 ,  color: Colors.white),
          ),
        )
            : ListView.builder(
          itemCount: cartProvider.purchasedItems.length,
          itemBuilder: (context, index) {
            final item = cartProvider.purchasedItems[index];
            return Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ListTile(
                leading: Image.asset(item.imageUrl, width: 60, height: 60),
                title: Text(item.name),
                subtitle: Text(
                  'Price: \$${(item.discountedPrice ?? item.price).toStringAsFixed(2)}',
                  style: TextStyle(color: Colors.green),
                ),
                trailing: Text(
                  'Quantity: ${item.quantity}',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}