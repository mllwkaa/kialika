import 'package:flutter/material.dart';

import 'joziat.dart';

class AllProductsPage extends StatelessWidget {
  final String title; // عنوان صفحه (مثلاً "High Rated Products")
  final List<Map<String, dynamic>> products; // لیست محصولات فیلترشده

  const AllProductsPage({Key? key, required this.title, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.pink[200],
        elevation: 0.0,
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: products.isEmpty
          ? const Center(
        child: Text(
          "No products found.",
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      )
          : GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return _buildProductCard(product, context);
        },
      ),
    );
  }

  Widget _buildProductCard(Map<String, dynamic> product, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(productId: product['name']!),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.pink[100],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  product['image'],
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              product['name'],
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
            if (product['discountPrice'] != null)
              Text(
                '\$${product['discountPrice']}',
                style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
              ),
            Text(
              '\$${product['price']}',
              style: TextStyle(
                color: product['discountPrice'] != null ? Colors.red : Colors.white,
                decoration: product['discountPrice'] != null ? TextDecoration.lineThrough : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
