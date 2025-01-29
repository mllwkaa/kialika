import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(const welcome());
}

class welcome extends StatelessWidget {
  const welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Example',
      home: const CenterImagePage(), // صفحه ای که عکس در وسط آن قرار دارد
      routes: {
        '/home': (context) => Home(), // مسیر صفحه اصلی
      },
    );
  }
}

class CenterImagePage extends StatelessWidget {
  const CenterImagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[200],
      body:
      Center(
        child: GestureDetector( // برای تشخیص کلیک روی عکس
          onTap: () {
            Navigator.pushNamed(context, '/home'); // رفتن به صفحه اصلی با نام مسیر
            // یا از این روش هم میتوان استفاده کرد:
            // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
            // تفاوت این روش با pushNamed در این است که صفحه قبلی از history navigation حذف میشود و کاربر با زدن دکمه back به این صفحه برنمیگردد.
          },
          child: Image.asset(
            'assets/welcome.jpg', // مسیر عکس در assets
            width: 400, // تعیین عرض عکس
            height: 300, // تعیین ارتفاع عکس
            fit: BoxFit.cover, // نحوه نمایش عکس در ابعاد تعیین شده (cover: کل فضا را پر میکند و ممکن است قسمتی از عکس بریده شود)
          ),
        ),
      ),
    );
  }
}
