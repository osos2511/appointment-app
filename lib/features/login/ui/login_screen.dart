import 'package:appoinment_app/core/theming/colors.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text( 'LoginScreen',style: TextStyle(color: Colors.white),),
      backgroundColor: ColorsManager.mainBlue,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Text('Login Screen'),
      ),
    );
  }
}
