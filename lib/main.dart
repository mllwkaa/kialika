import 'package:flutter/material.dart';
import 'package:kialika/signuporlogin.dart';
import 'package:provider/provider.dart';
import 'cartprovider.dart'; // وارد کردن CartProvider
import 'nextshopprovider.dart'; // وارد کردن NextShopProvider
import 'favoriteprovider.dart'; // وارد کردن FavoriteProvider


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()), // مدیریت سبد خرید
        ChangeNotifierProvider(create: (_) => NextShopProvider()), // مدیریت فروشگاه
        ChangeNotifierProvider(create: (_) => FavoriteProvider()), // مدیریت علاقه‌مندی‌ها
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'اپلیکیشن فروشگاهی', // عنوان اپلیکیشن
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent), // تم رنگی
        useMaterial3: true, // استفاده از متریال دیزاین ۳
      ),
      home: first(), // صفحه اصلی (ورود/ثبت‌نام)
    );
  }
}
