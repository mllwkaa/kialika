import 'package:flutter/material.dart';
import 'package:kialika/signup.dart';


import 'login.dart';


class first extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[300],
      body: Center(
        child: Column(
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
      ),
    );
  }
}
