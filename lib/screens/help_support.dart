import 'package:flutter/material.dart';
import 'package:flash_fuel/widgets/main_scaffold.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      currentIndex: 0,
      child: Column(
        children: [
          AppBar(
            title: const Text(
              'Help & Support',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            automaticallyImplyLeading: false,
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                _buildSupportCard(
                  icon: Icons.lightbulb_outline,
                  text: 'Frequently asked questions',
                  onTap: () {
                    Navigator.pushNamed(context, '/faq');
                    // TODO: Navigate to FAQ screen or show dialog
                  },
                ),
                const SizedBox(height: 16),
                _buildSupportCard(
                  icon: Icons.call_outlined,
                  text: 'Contact Us',
                  onTap: () {
                    Navigator.pushNamed(context, '/contact_us');
                    // TODO: Navigate to Contact screen or perform action
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSupportCard({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: Colors.green),
        title: Text(text),
        onTap: onTap,
      ),
    );
  }
}
