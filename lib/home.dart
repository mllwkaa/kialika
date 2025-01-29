import 'package:flutter/material.dart';
import 'package:kialika/welcom.dart';
import 'Allproductspage.dart';
import 'category.dart';
import 'joziat.dart'; // وارد کردن صفحه جزئیات محصول
import 'sabadkharid.dart'; // وارد کردن صفحه سبد خرید
import 'userProfile.dart'; // وارد کردن صفحه پروفایل کاربری

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // لیست کلی محصولات
  final List<Map<String, dynamic>> allProducts = [
    {'name': 'Honey Infused Hair Oil', 'image': 'assets/remove bg/honey-removebg-preview.png', 'rating': 4.8, 'sold': 200, 'discountPrice': 40, 'price': 45},
    {'name': 'CeraVe Hydrating Cleanser', 'image': 'assets/remove bg/cerave-removebg-preview.png', 'rating': 4.5, 'sold': 150, 'discountPrice': 15, 'price': 21},
    {'name': '30 Montaigne Short Necklace', 'image': 'assets/remove bg/brac-removebg-preview.png', 'rating': 4.0, 'sold': 100, 'discountPrice': 650, 'price': 680},
    {'name': 'Dior Forever Couture Luminizer', 'image': 'assets/remove bg/dior-removebg-preview.png', 'rating': 4.9, 'sold': 150, 'discountPrice': 61, 'price': 66},
    {'name': 'Yves Saint Laurent Libre Eau de Parfum 150 ml', 'image': 'assets/remove bg/libra-removebg-preview.png', 'rating': 4.8, 'sold': 250, 'discountPrice': 185.95, 'price': 200},
    {'name': 'Charlotte Magic Serum Crystal Elixir', 'image': 'assets/remove bg/magic-removebg-preview.png', 'rating': 4.6, 'sold': 80, 'discountPrice': 79, 'price': 85},
    {'name': 'Rosemary Mint Scalp & Hair Strengthening Oil', 'image': 'assets/remove bg/rose-removebg-preview.png', 'rating': 4.8, 'sold': 100, 'discountPrice': null, 'price': 19.99},
    {'name': 'Dior Lip Oil', 'image': 'assets/remove bg/lipoil-removebg-preview.png', 'rating': 4.8, 'sold': 150, 'discountPrice': null, 'price': 70},
    {'name': 'Marvis Sensitive Gums Gentle Mint Toothpaste (75ml)', 'image': 'assets/remove bg/marvis-removebg-preview.png', 'rating': 4.5, 'sold': 95, 'discountPrice': 15, 'price': 20},
    {'name': 'LA CREME MAIN CHANEL', 'image': 'assets/remove bg/chanel-removebg-preview.png', 'rating': 5, 'sold': 95, 'discountPrice': null, 'price': 56},
    {'name': 'Miss Dior', 'image': 'assets/remove bg/missdior-removebg-preview.png', 'rating': 4.8, 'sold': 98, 'discountPrice': null, 'price': 70},
    {'name': 'Dio(r)evolution Ring', 'image': 'assets/remove bg/ring-removebg-preview.png', 'rating': 4.8, 'sold': 10, 'discountPrice': null, 'price': 320},
  ];

  // متغیر برای جستجو
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    // فیلتر محصولات بر اساس جستجو
    final filteredProducts = allProducts.where((product) {
      final name = product['name']!.toLowerCase();
      final query = searchQuery.toLowerCase();
      return name.contains(query);
    }).toList();

    // فیلتر محصولات با امتیاز بالا
    final highRatedProducts = filteredProducts.where((p) => p['rating'] >= 4.5).toList();
    // فیلتر محصولات با تخفیف
    final bestSellers = filteredProducts.where((p) => p['discountPrice'] != null).toList();
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.pink[200],
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => welcome()));
          },
        ),
        title: const Text(
          "KIALIKA",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // نوار جستجو
              TextField(
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search for products...',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // بخش کارت‌های تبلیغاتی
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: SizedBox(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5, // تعداد کارت‌های تبلیغاتی
                    itemBuilder: (context, index) {
                      return _buildAdCard(index);
                    },
                  ),
                ),
              ),
              // بخش محصولات با امتیاز بالا
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'High Rated Products',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.pink),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AllProductsPage(
                            title: 'High Rated Products',
                            products: highRatedProducts,
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      'show more',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: highRatedProducts.length > 3 ? 3 : highRatedProducts.length,
                  itemBuilder: (context, index) {
                    final product = highRatedProducts[index];
                    return _buildProductCard(product);
                  },
                ),
              ),
              const SizedBox(height: 20),
              // بخش محصولات با فروش ویژه
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Best Sellers',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.pink),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AllProductsPage(
                            title: 'Best Sellers',
                            products: bestSellers,
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      'show more',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: bestSellers.length > 3 ? 3 : bestSellers.length,
                  itemBuilder: (context, index) {
                    final product = bestSellers[index];
                    return _buildProductCard(product);
                  },
                ),
              ),
            ],
          ),
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

  Widget _buildProductCard(Map<String, dynamic> product) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProductDetailPage(productId: product['name']!)),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        width: 150,
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
            SizedBox(height: 8),
            Text(
              product['name'],
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            if (product['discountPrice'] != null)
              Text(
                '\$${product['discountPrice']}',
                style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
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

  // ساخت کارت تبلیغاتی با تصویر
  Widget _buildAdCard(int index) {
    List<String> adImages = [
      'assets/offer/adv1.JPG', // تصویر تبلیغاتی 1
      'assets/offer/adv2.JPG', // تصویر تبلیغاتی 2
      'assets/offer/adv3.JPG', // تصویر تبلیغاتی 3
      'assets/offer/adv4.JPG', // تصویر تبلیغاتی 4
      'assets/offer/adv5.JPG', // تصویر تبلیغاتی 5
    ];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          adImages[index],
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
