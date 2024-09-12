import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class ProfileEditScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfileEditScreenState();
  }
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  bool _passwordVisibility = false;
  XFile? _selectedImage;

  Future<void> _pickImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          _selectedImage = image;
        });
      }
    } catch (e) {
      print("Error picking image: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: GestureDetector(
                onTap: _pickImage,
                child: CircleAvatar(
                  backgroundImage: _selectedImage != null
                      ? FileImage(File(_selectedImage!.path))
                      : AssetImage('assets/images/person.webp') as ImageProvider,
                  radius: 60,
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w300,
                letterSpacing: 1,
              ),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person, color: Colors.black),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                labelText: 'Username',
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  letterSpacing: 0,
                ),
                hintStyle: TextStyle(color: Colors.black12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w300,
                letterSpacing: 1,
              ),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email, color: Colors.black),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                labelText: 'Email Address',
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  letterSpacing: 0,
                ),
                hintStyle: TextStyle(color: Colors.black12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              maxLength: 8,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w300,
                letterSpacing: 1,
              ),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock, color: Colors.black),
                suffixIcon: IconButton(
                  icon: !_passwordVisibility
                      ? Icon(Icons.visibility, color: Colors.black)
                      : Icon(Icons.visibility_off, color: Colors.black),
                  onPressed: () {
                    setState(() {
                      _passwordVisibility = !_passwordVisibility;
                    });
                  },
                ),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                labelText: 'Password',
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  letterSpacing: 0,
                ),
                hintStyle: TextStyle(color: Colors.black12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              ),
              obscureText: !_passwordVisibility,
            ),
            SizedBox(height: 20),
            IntlPhoneField(
              decoration: InputDecoration(
                labelText: 'Phone Number',
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  letterSpacing: 0,
                ),
                hintStyle: TextStyle(color: Colors.black12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              ),
              initialCountryCode: 'IN', // Default country code
              onChanged: (phone) {
                print(phone.completeNumber); // Output complete phone number
              },
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w300,
                letterSpacing: 1,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w300,
                letterSpacing: 1,
              ),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.home_filled, color: Colors.black),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                labelText: 'Residential Address',
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  letterSpacing: 0,
                ),
                hintStyle: TextStyle(color: Colors.black12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Save Changes",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
