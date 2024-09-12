import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: Colors.red[100]),
          Positioned(
            top: 30,
            left: 16, // Adjust this value as needed
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Aligns children to the start (left)
              children: [
                Text(
                  "Hi Rahul!",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                    fontSize: 35,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Have a look at your profile",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.5,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              padding: const EdgeInsets.only(left: 16,right: 16,top: 28,bottom: 50),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 3,
                    spreadRadius: 3,
                    offset: Offset(0, -5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/person.webp'),
                    radius: 60,
                  ),
                  SizedBox(height: 20),
                  buildUIItem(Icons.person, "Rahul Verma"),
                  SizedBox(height: 20),
                  buildUIItem(Icons.email, "rahulverma01@gmail.com"),
                  SizedBox(height: 20),
                  buildUIItem(Icons.phone, "+91-7389836702"),
                  SizedBox(height: 20),
                  buildUIItem(Icons.location_on, "4th Street 001, Victoria Road, Mumbai, 123113"),
                  SizedBox(height: 30),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/profile_edit');
                        print("Edit Profile Pressed");
                      },
                      child: Text(
                        "Edit Profile",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildUIItem(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 2,
            spreadRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
      ),
      width: double.infinity, // Expands to cover the remaining width
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.red,
            size: 24,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.5,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
