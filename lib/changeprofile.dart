import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  final String currentName;
  final String currentEmail;
  final Function(String, String) onSave;

  const EditProfile({
    super.key,
    required this.currentName,
    required this.currentEmail,
    required this.onSave,
  });

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.currentName);
    _emailController = TextEditingController(text: widget.currentEmail);
  }

  bool _isValidEmail(String email) {
    final RegExp emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Edit profile"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.pinkAccent,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  suffixIconColor: Colors.pinkAccent,
                  hintText: "username",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Username cannot be empty.";
                  }
                  return null; // معتبر
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  suffixIconColor: Colors.pinkAccent,
                  hintText: "email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email cannot be empty.";
                  } else if (!_isValidEmail(value)) {
                    return "Email is not valid.";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    widget.onSave(
                      _nameController.text,
                      _emailController.text,
                    );
                    Navigator.pop(context);//برای اعمال تغییرات در صفحه ی فعلی و بازگشت به صفحه ی قبل
                  }
                },
                child: const Text("Save changes"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
