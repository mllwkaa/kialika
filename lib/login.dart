import 'package:flutter/material.dart';
import 'package:kialika/signuporlogin.dart';
import 'package:kialika/welcom.dart';



class login extends StatefulWidget {
  const login({super.key});

  @override
  _loginState createState() => _loginState();
}
class _loginState extends State<login> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _passwordVisible = false;

  @override void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.pink[300],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => first()),
            );
          },
        ),
      ),
      body: Container(
        color: Colors.pink[300]
        ,
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Login',
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold , color: Colors.white),
                ),
                SizedBox(height: 40),
                Form(
                  child: Column(
                    children:[
                      const TextField(
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            prefixIcon: Icon(Icons.person),
                            border: OutlineInputBorder(),
                            filled: true,
                            hintText: "Username"
                        ),


                      ),


                      SizedBox(height: 14),
                      TextField(
                        controller: _passwordController,
                        obscureText: !_passwordVisible,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          prefixIcon: const Icon(Icons.password),
                          border: const OutlineInputBorder(),
                          filled: true,
                          hintText: "Password",
                          suffixIcon: IconButton(
                            icon: Icon(
                              _passwordVisible ? Icons.visibility : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          ),
                        ),

                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const welcome(),
                            ),
                          );

                        },
                        child: Text(
                          'Login',
                          selectionColor: Colors.pinkAccent
                          ,),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );


  }

}
