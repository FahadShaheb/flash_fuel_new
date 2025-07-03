import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flash_fuel/screens/auth/login_signup_landing.dart';
import 'package:flash_fuel/widgets/product_list.dart'; // Home screen

class AuthCheckScreen extends StatelessWidget {
  const AuthCheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasData) {
          // ✅ User is logged in
          return const ProductList();
        } else {
          // ❌ User not logged in
          return const LoginSignupLanding();
        }
      },
    );
  }
}
