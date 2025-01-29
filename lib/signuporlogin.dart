import 'package:flutter/material.dart';
import 'package:kialika/signup.dart';
import 'login.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // دسترسی به اندازه صفحه نمایش
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // طراحی ریسپانسیو
    return Scaffold(
      backgroundColor: Colors.pink[300],
      body: Center(
        child: screenWidth > 600
            ? Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // بخش متن و دکمه‌ها برای صفحه‌های بزرگ
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'KIALIKA SHOP',
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => signup()),
                    );
                  },
                  child: Text('SIGN UP'),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => login()),
                    );
                  },
                  child: Text('LOG IN'),
                ),
              ],
            ),
            // بخش خالی برای طراحی ریسپانسیو
            Container(
              width: screenWidth * 0.3, // عرض کم برای بخش خالی
              color: Colors.pinkAccent.withOpacity(0.1),
            ),
          ],
        )
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // برای صفحات کوچک‌تر (موبایل)
            const Text(
              'KIALIKA SHOP',
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => signup()),
                );
              },
              child: Text('SIGN UP'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => login()),
                );
              },
              child: Text('LOG IN'),
            ),
          ],
        ),
      ),
    );
  }
}
