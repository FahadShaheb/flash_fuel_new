import 'package:flutter/material.dart';

class TermsConditionsScreen extends StatelessWidget {
  const TermsConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Terms & Conditions"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Terms and Conditions for FlashFuel",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text("Last Updated: July 2, 2025\n"),

            Text(
              "Welcome to FlashFuel! These Terms and Conditions govern your use of the FlashFuel mobile application and services. By creating an account or using our Service, you agree to be bound by these Terms.\n",
              style: TextStyle(height: 1.5),
            ),

            Text("1. Service Description:\nFlashFuel is an on-demand fuel delivery platform offering scheduled or emergency fuel delivery. Platform choices must not be used in risky or hazardous locations.\n"),

            Text("2. User Accounts:\n- You must register with accurate information.\n- Keep your login credentials safe.\n- You are responsible for all activity through your account.\n"),

            Text("3. Ordering and Payment:\n- Orders can be placed via the app.\n- Payment is made through secure options.\n- We are not liable for gateway-related issues.\n"),

            Text("4. Delivery and Location:\n- Fuel delivery is handled by authorized partners only.\n- Ensure accurate address and access permission.\n- We may cancel delivery if unsafe or restricted.\n"),

            Text("5. User Conduct:\n- Do not misuse the app or service.\n- No illegal, harmful, or unauthorized activity.\n"),

            Text("6. Intellectual Property:\n- FlashFuel owns all app content and design.\n- You may not reproduce or resell any part.\n"),

            Text("7. Disclaimer and Limitation of Liability:\n- Service is provided 'as is'.\n- We are not liable for any direct or indirect damages.\n"),

            Text("8. Termination:\n- We may suspend your account for violations.\n- No prior notice is required.\n"),

            Text("9. Changes to Terms:\n- Terms may change without notice.\n- Continued use = acceptance of changes.\n"),

            SizedBox(height: 24),
            Text(
              "Privacy Policy for FlashFuel",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),

            Text("Last Updated: July 2, 2025\n"),

            Text("1. Introduction:\n- We collect your name, contact number, email, address, and location for orders and delivery.\n"),

            Text("2. How We Use Information:\n- To process your order, improve service, personalize your experience, and notify you of updates.\n"),

            Text("3. Who We Share With:\n- Delivery partners and service providers.\n- Law enforcement only when required.\n"),

            Text("4. Data Security:\n- We use encryption and secure servers.\n- You are responsible for device security.\n"),

            Text("5. Your Rights:\n- You may access, update, or delete your data anytime.\n"),

            Text("6. Contact:\n- Reach out through the in-app Help & Support.\n"),

            SizedBox(height: 30),
            Center(
              child: Text(
                "Thank you for using FlashFuel!",
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
