import 'package:flutter/material.dart';
import 'package:kialika/shop.dart';
import 'package:kialika/support.dart';
import 'category.dart';
import 'deleteaccount.dart';
import 'favorite.dart';
import 'home.dart';
import 'sabadkharid.dart';
import 'changeprofile.dart';
import 'eshterak.dart';
import 'nextShop.dart';



class userProfile extends StatefulWidget {
  const userProfile({super.key});

  @override
  State<userProfile> createState() => _userProfileState();
}

class _userProfileState extends State<userProfile> {
  String username = "melika arjomandfard";
  String email = "melikaarjomand@gmail.com";
  String subscription = "Regular"; // مقدار پیش‌فرض اشتراک

  // تابع برای به‌روزرسانی اشتراک
  void updateSubscription(String newSubscription) {
    setState(() {
      subscription = newSubscription;
    });
  }
  List<CartItem> cartItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.pinkAccent),
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.pinkAccent),
          onPressed: () {
            // بازگشت به صفحه home
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          },
        ),
        centerTitle: true,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "User Profile",
              style: TextStyle(color: Colors.pinkAccent),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              child: Container(
                width: 150,
                height: 150,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/profile.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // نمایش نام کاربری
            Text(
              username,
              style: const TextStyle(
                color: Colors.pinkAccent,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),

            // نمایش ایمیل و اشتراک
            Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Email"),
                      Text(email),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Subscription"),
                      Text(subscription, style: const TextStyle(color: Colors.pinkAccent, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // صفحه ویرایش اطلاعات
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfile(
                            currentName: username,
                            currentEmail: email,
                            onSave: (String newName, String newEmail) {
                              setState(() {
                                username = newName;
                                email = newEmail;
                              });
                            },
                          ),
                        ),
                      );
                    },
                    child: const Text("Edit Profile"),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // گزینه خرید اشتراک ویژه
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink[200],
                  minimumSize: const Size(double.infinity, 40),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => eshterak(
                        onSubscriptionUpdate: updateSubscription, // ارسال تابع برای به‌روزرسانی
                      ),
                    ),
                  );
                },
                child: const Text(
                  "Buy a Subscripion",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // لیست گزینه‌ها
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.favorite, color: Colors.pinkAccent),
                    title: const Text("Favorite"),
                    trailing: const Icon(Icons.double_arrow_outlined, size: 16),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FavoritePage()),
                      );
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.shopping_cart, color: Colors.pinkAccent),
                    title: const Text("Buy Again"),
                    trailing: const Icon(Icons.double_arrow_outlined, size: 16),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const shop()),
                      );
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.add_shopping_cart, color: Colors.pinkAccent),
                    title: const Text("Next Buy"),
                    trailing: const Icon(Icons.double_arrow_outlined, size: 16),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NextShopPage()),
                      );
                    },
                  ),
                ],
              ),
            ),

            SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 40),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const support()),
                      );
                    },

                    icon: const Icon(Icons.comment),
                    label: const Text("Support"),
                  ),

                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 40),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const deletaccont()),
                      );
                    },

                    icon: const Icon(Icons.delete),
                    label: const Text("Delete Account"),
                  ),
                ],
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
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'categories',
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
          if (index ==0  ) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          }

          if (index == 1 ) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => category()),
            );
          }
          if (index == 2) {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage())
            );
          }
          if (index == 3) {
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