import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  clearSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('newLaunch');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Please Welcome \n\t\t\t\t\t\t\t\t\t to the\n \t\t\t\t\t\tSCREEN', style: TextStyle(fontSize: 40),),
            ElevatedButton(onPressed: () => clearSharedPreferences(), child: Text('Clear App'))
          ],
        ) ,
      ),
    );
  }
}