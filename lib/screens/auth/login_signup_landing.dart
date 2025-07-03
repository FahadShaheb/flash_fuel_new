import 'package:flutter/material.dart';
import 'package:flash_fuel/screens/auth/login_screen.dart';
import 'package:flash_fuel/screens/auth/signup_screen.dart';

class LoginSignupLanding extends StatelessWidget {
  const LoginSignupLanding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(flex: 2),

            // Exclamation Icon
            const Icon(Icons.error_outline, size: 64, color: Colors.green),

            const SizedBox(height: 20),

            const Text(
              "Login or Sign Up",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "Access your account or create a new one to enjoy\npersonalized features.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black54),
            ),

            const Spacer(),

            // Login Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4CAF50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const LoginScreen()));
                  },
                  child: const Text("Login", style: TextStyle(fontSize: 16)),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // OR Divider
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Expanded(child: Divider(thickness: 1, indent: 24, endIndent: 8)),
                Text("OR"),
                Expanded(child: Divider(thickness: 1, indent: 8, endIndent: 24)),
              ],
            ),

            const SizedBox(height: 16),

            // Sign Up Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.grey),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const SignupScreen()));
                  },
                  child: const Text("Sign Up",
                      style: TextStyle(fontSize: 16, color: Color(0xFF4CAF50))),
                ),
              ),
            ),

            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
