import 'package:flutter/material.dart';
import 'package:kialika/sabadkharid.dart';
import 'cosmeticPage.dart';
import 'HairCarePage.dart';
import 'PerfumePage.dart';
import 'home.dart';
import 'hygienicpage.dart';
import 'jewelryPage.dart';
import 'skinCarePage.dart';
import 'userprofile.dart';

class category extends StatefulWidget {
  const category({Key? key}) : super(key: key);

  @override
  State<category> createState() => _categoryState();
}

class _categoryState extends State<category> {
  List<CartItem> cartItems = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.pinkAccent),
        backgroundColor: Colors.pink[200],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // بازگشت به صفحه home
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          },
        ),
        centerTitle: true,
        title: const Row(//برای اینکه بتونیم تو اپ بار چند تا آیکون داشته باشیم
          mainAxisSize: MainAxisSize.min,//برای اینکه سابز نوشتمون متناسب باشه
          children: [
            Text(
              "Categories",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),

      body:

      SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                const SizedBox(height: 20 ),//فاصله ی بین ویجت ها
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Cosmeticpage(),
                        ));
                  },
                  child: Container(
                    height: 180,
                    width: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color:Colors.pink[200],
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                            width: 180,
                            height: 180,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: Image.asset(
                                "assets/Cosmetic.jpg",
                                fit: BoxFit.cover,
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),//فاصله ی بین باکس و تکست
                Text('Cosmetic '),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HygienicPage(),
                        ));
                  },
                  child: Container(
                    height: 180,
                    width: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color:Colors.pink[100],
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                            width: 180,
                            height: 180,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: Image.asset(
                                "assets/Hygienic.jpg",
                                fit: BoxFit.cover,
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text('Hygienic'),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>Skincarepage(),
                        ));
                  },
                  child: Container(
                    height: 180,
                    width: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color:Colors.pink[100],
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                            width: 180,
                            height: 180,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: Image.asset(
                                "assets/Skincare.jpg",
                                fit: BoxFit.cover,
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text('Skin Care  '),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>HairCarePage(),
                        ));
                  },
                  child: Container(
                    height: 180,
                    width: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color:Colors.pink[100],
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                            width: 180,
                            height: 180,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: Image.asset(
                                "assets/HairCare.jpg",
                                fit: BoxFit.cover,
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text('Hair Care '),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Perfumepage(),
                        ));
                  },
                  child: Container(
                    height: 180,
                    width: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color:Colors.pink[100],
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                            width: 180,
                            height: 180,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: Image.asset(
                                "assets/Perfume.jpg",
                                fit: BoxFit.cover,
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text('Perfume'),
                const SizedBox(height: 10),

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Jewelrypage(),
                        ));
                  },
                  child: Container(
                    height: 180,
                    width: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color:Colors.pink[100],
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                            width: 180,
                            height: 180,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: Image.asset(
                                "assets/jewelry.jpg",
                                fit: BoxFit.cover,
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text('Accessoris'),
                const SizedBox(height: 10),




              ],
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
              MaterialPageRoute(builder: (context) => CartPage()),
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