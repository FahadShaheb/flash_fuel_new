import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flash_fuel/widgets/main_scaffold.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      currentIndex: 3, // 👈 Highlights the Account tab
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          children: [
            // Profile Section
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: const [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                      radius: 37,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person_outline, size: 50, color: Colors.green),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Waliullah Fahad",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Menu Options with navigation logic
            _buildAccountTile(
              Icons.list_alt,
              "My Orders",
              () => Navigator.pushNamed(context, '/my_orders'),
            ),

            _buildAccountTile(Icons.directions_car, "My Vehicles", 
            () => Navigator.pushNamed(context, '/my_vehicles'),
            ),

            _buildAccountTile(Icons.bookmark_border, 
            "My Saved Products", 
            () => Navigator.pushNamed(context, '/favorites'),
            ),

           _buildAccountTile(
              Icons.account_balance_wallet,
              "My Wallet",
              () => Navigator.pushNamed(context, '/my_wallet'),
            ),

            _buildAccountTile(Icons.info_outline, "Information",
             () => Navigator.pushNamed(context, '/information'),
             ),

            _buildAccountTile(Icons.description_outlined, "Terms & Privacy Policy",
             () => Navigator.pushNamed(context, '/terms_and_privacy_policy'),
             ),
             
            _buildAccountTile(
              Icons.logout,
              "Logout",
              () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildAccountTile(IconData icon, String title, VoidCallback onTap) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        tileColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        leading: Icon(icon, color: Colors.green),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
