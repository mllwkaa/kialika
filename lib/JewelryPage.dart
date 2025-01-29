import 'package:flutter/material.dart';

import 'joziat.dart';

class Jewelrypage extends StatefulWidget {
  @override
  _JewelrypageState createState() => _JewelrypageState();
}

class _JewelrypageState extends State<Jewelrypage> {
  // لیست نمونه‌ای از محصولات
  List<Map<String, dynamic>> products = [
    {
      'name': '30 Montaigne Short Necklace',
      'price': 680,
      'discountPrice': 650,
      'rating': 4.5,
      'sales': 100,
      'image': 'assets/jewelry/brac.jpg',
    },
    {
      'name': 'Dio(r)evolution Ring',
      'price': 320,
      'discountPrice': null,
      'rating': 4.8,
      'sales': 10,
      'image': 'assets/jewelry/ring.jpg',
    },
  ];

  String searchQuery = ''; // مقدار جستجو
  String sortType = 'default'; // نوع مرتب‌سازی

  @override
  Widget build(BuildContext context) {
    // فیلتر کردن محصولات بر اساس جستجو
    List<Map<String, dynamic>> filteredProducts = products.where((product) {
      return product['name'].toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();
    // مرتب‌سازی محصولات بر اساس نوع انتخاب‌شده
    if (sortType == 'high_price') {
      filteredProducts.sort((a, b) => b['price'].compareTo(a['price']));
    } else if (sortType == 'low_price') {
      filteredProducts.sort((a, b) => a['price'].compareTo(b['price']));
    } else if (sortType == 'best_seller') {
      filteredProducts.sort((a, b) => b['rating'].compareTo(a['rating']));
    }

    return Scaffold(
      backgroundColor: Colors.pink[100],
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.pinkAccent),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          "Jewely",
          style: TextStyle(color: Colors.pinkAccent),
        ),
      ),
      body: Column(
        children: [
          // نوار جستجو
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.pinkAccent,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),

          // دکمه مرتب‌سازی
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      sortType = 'high_price';
                    });
                  },
                  child: Text('High Price'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      sortType = 'low_price';
                    });
                  },
                  child: Text('Low Price'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      sortType = 'best_seller';
                    });
                  },
                  child: Text('Best Seller'),
                ),
              ],
            ),
          ),

          // لیست محصولات
          Expanded(
            child: ListView.builder(
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                final product = filteredProducts[index];
                return Container(
                  child: Card(
                    color: Colors.white,
                    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    elevation: 4,

                    child: ListTile(
                      contentPadding: const EdgeInsets.all(5),
                      leading: Image.asset(
                        product['image'],
                        width: 70,
                        height: 70,
                        fit: BoxFit.fitHeight,
                      ),
                      title: Text(
                        product['name'],
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // نمایش قیمت و تخفیف
                          product['discountPrice'] != null
                              ? Row(
                            children: [
                              Text(
                                '\$${product['discountPrice']}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '\$${product['price']}',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.red,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ],
                          )
                              : Text(
                            '\$${product['price']}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
// امتیاز محصول
                          Row(
                            children: [
                              const Icon(Icons.star, color: Colors.amber , size: 14,),
                              const SizedBox(width: 4),
                              Text(
                                'Score: ${product['rating']}',
                                style: const TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                      onTap: () {
                        // هدایت به صفحه جزئیات محصول
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailPage(productId: product['name']),
                          ),
                        );
                      },
                    ),
                  ),
                );

              },
            ),
          )
        ],
      ),
    );
  }
}
