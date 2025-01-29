import 'package:flutter/material.dart';
import 'userprofile.dart';

class support extends StatelessWidget {
  const support({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.pinkAccent),
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.pinkAccent),
          onPressed: () {
            // بازگشت به صفحه username
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const userProfile()),
            );
          },
        ),
        centerTitle: true,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.health_and_safety, color: Colors.pinkAccent),
            SizedBox(width: 8), // فاصله بین آیکون و متن
            Text(
              "پشتیبانی",
              style: TextStyle(color: Colors.pinkAccent),
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.pink[100],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.pinkAccent,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white38,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_sharp),
            label: 'ShoppingCard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          if (index == 3) {
            // در صورتی که روی "Profile" کلیک شد، به صفحه پروفایل بروید
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const userProfile()),
            );
          }
        },
      ),
    );
  }
}
