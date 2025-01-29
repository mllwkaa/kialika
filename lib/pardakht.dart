import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cartprovider.dart'; // وارد کردن CartProvider
import 'shop.dart'; // وارد کردن صفحه shop

class PaymentPage extends StatefulWidget {
  final double paymentAmount;
  final String address;

  const PaymentPage({Key? key, required this.paymentAmount, required this.address}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController pinController = TextEditingController();
  String errorMessage = '';

  void processPayment(BuildContext context) {
    String cardNumber = cardNumberController.text;
    String pin = pinController.text;
    String correctPin = cardNumber.substring(cardNumber.length - 4);

    if (cardNumber.length != 16) {
      setState(() {
        errorMessage = 'Invalid card number';
      });
    } else {
      if (pin == correctPin) {
        setState(() {
          errorMessage = '';
        });

        final cartProvider = Provider.of<CartProvider>(context, listen: false);

        // انتقال کالاها به لیست خریداری‌شده و پاک کردن سبد خرید
        cartProvider.checkout();

        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Thank you for choosing us"),
            content: Text("Your payment of ${widget.paymentAmount} has been successfully processed."),
            backgroundColor: Colors.pink[100],
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // بستن دیالوگ
                  Navigator.pushReplacement( // هدایت به صفحه کالاهای خریداری شده
                    context,
                    MaterialPageRoute(builder: (context) => shop()),
                  );
                },
                child: Text("OK"),
              ),
            ],
          ),
        );
      } else {
        setState(() {
          errorMessage = 'Password is incorrect';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Online Payment"),
        backgroundColor: Colors.pink[100],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: cardNumberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Card Number",
                hintText: "Please enter your card number",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: pinController,
              obscureText: true,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Password",
                hintText: "Please enter your password",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            if (errorMessage.isNotEmpty)
              Text(
                errorMessage,
                style: TextStyle(color: Colors.red, fontSize: 18),
              ),
            SizedBox(height: 16),
            Text(
              "Payment Amount: ${widget.paymentAmount} dollars",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => processPayment(context), // ارسال context به تابع processPayment
              child: Text("Pay"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink[200],
                padding: EdgeInsets.symmetric(vertical: 16),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}