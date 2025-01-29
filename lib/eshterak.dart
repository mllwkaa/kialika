import 'package:flutter/material.dart';
import 'package:kialika/pardakht.dart';
import 'userprofile.dart';

class eshterak extends StatelessWidget {
  final Function(String) onSubscriptionUpdate;

  const eshterak({super.key, required this.onSubscriptionUpdate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.pink[200],
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          "Subscription management ",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        color: Colors.pink[50],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => _showSubscriptionOptions(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink[200],
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                ),
                child: const Text(
                  "Subscription type",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSubscriptionOptions(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.pink[200],
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 15),
            const Text(
              "Subscription type",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 20),
            _buildSubscriptionOption(context, "Regular - Free", "معمولی"),
            _buildSubscriptionOption(context, " 1 month - 10 ", "1-month"),
            _buildSubscriptionOption(context, " 3 month - 20 ", "3-month"),
            _buildSubscriptionOption(context, "  1 year - 50 ", "1-year"),
          ],
        );
      },
    );
  }

  Widget _buildSubscriptionOption(BuildContext context, String title, String subscriptionType) {
    return ListTile(
      title: Text(title, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white)),
      onTap: () {
        Navigator.pop(context); // بستن Bottom Sheet
        _goToPayment(context, subscriptionType);
      },
    );
  }

  void _goToPayment(BuildContext context, String type) {
    double paymentAmount;

    // تعیین مبلغ بر اساس نوع اشتراک
    switch (type) {
      case "1-month":
        paymentAmount = 10.0;
        break;
      case "3-month":
        paymentAmount = 20.0;
        break;
      case "1-year":
        paymentAmount = 50.0;
        break;
      default:
        paymentAmount = 0.0; // اشتراک رایگان
        break;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PaymentPage(paymentAmount: paymentAmount, address: '',),
      ),
    ).then((_) {
      // پس از بازگشت از صفحه پرداخت، وضعیت اشتراک را به‌روزرسانی می‌کنیم
      if (type != "معمولی") {
        onSubscriptionUpdate(type);
      }
    });
  }
}