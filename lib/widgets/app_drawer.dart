import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blueAccent),
            child: Text(
              'Flash Fuel',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.shopping_bag),
            title: const Text('My Orders'),
            onTap: () {
              Navigator.pushNamed(context, '/my_orders');
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('My Favorites'),
            onTap: () {
              Navigator.pushNamed(context, '/favorites');
              // Navigate to My Orders screen
            },
          ),
          ListTile(
            leading: const Icon(Icons.local_offer),
            title: const Text('Offers and Promotions'),
            onTap: () {
              Navigator.pushNamed(context, '/offers_promotions');
              // Navigate to Offers screen
            },
          ),
          ListTile(
            leading: const Icon(Icons.business),
            title: const Text('Business Service'),
            onTap: () {
              // Navigate to Business Service screen
            },
          ),
          ListTile(
            leading: const Icon(Icons.help_outline),
            title: const Text('Help & Support'),
            onTap: () {
              Navigator.pushNamed(context, '/help_support');
              // Navigate to Help screen
            },
          ),
         /* ListTile(
            leading: const Icon(Icons.contact_phone),
            title: const Text('Contact Us'),
            onTap: () {
              // Navigate to Contact screen
            },
          ), */
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Log Out', style: TextStyle(color: Colors.red)),
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }
}
