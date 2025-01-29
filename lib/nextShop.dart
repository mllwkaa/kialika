import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'nextshopprovider.dart';
import 'sabadkharid.dart';

class NextShopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final nextShopProvider = Provider.of<NextShopProvider>(context);

    return Scaffold(
      backgroundColor: Colors.pink[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.pinkAccent),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.add_shopping_cart, color: Colors.pinkAccent),
            SizedBox(width: 8),
            Text("My next shop", style: TextStyle(color: Colors.pinkAccent)),
          ],
        ),
      ),
      body: nextShopProvider.nextShopItems.isEmpty
          ? Center(
        child: Text(
          'No items in Next Shop!',
          style: TextStyle(fontSize: 18, color: Colors.pinkAccent),
        ),
      )
          : ListView.builder(
        itemCount: nextShopProvider.nextShopItems.length,
        itemBuilder: (context, index) {
          final item = nextShopProvider.nextShopItems[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: Image.asset(item.imageUrl, width: 50, height: 50, fit: BoxFit.cover),
              title: Text(item.name),
              subtitle: Text('Price: \$${item.price.toStringAsFixed(2)}'),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  nextShopProvider.removeFromNextShop(item.id);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
