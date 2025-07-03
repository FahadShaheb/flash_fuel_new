import 'package:flutter/material.dart';
import 'package:flash_fuel/widgets/main_scaffold.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      currentIndex: 0,
      child: Column(
        children: [
          AppBar(
            title: const Text(
              'Contact Us',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
            automaticallyImplyLeading: false,
          ),
          const Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: ContactContent(),
            ),
          ),
        ],
      ),
    );
  }
}

class ContactContent extends StatelessWidget {
  const ContactContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ContactCard(
          icon: Icons.chat_bubble_outline,
          title: 'Live Chat',
          details: [
            'Availability: 9 AM - 9 PM',
            'Description: "Get instant answers from our support agents. This is the fastest way to get help."',
          ],
        ),
        SizedBox(height: 16),
        ContactCard(
          icon: Icons.phone_outlined,
          title: 'Call Us',
          details: [
            'Hotline Number: +880 1518412035',
            'Availability: 24/7 (For emergencies) / 9 AM - 9 PM (For general queries)',
            'Description: "Speak directly with a customer support representative."',
          ],
        ),
        SizedBox(height: 16),
        ContactCard(
          icon: Icons.email_outlined,
          title: 'Email Us',
          details: [
            'Email Address: spectrexaz@gmail.com',
            'Availability: We respond within 12 hours.',
            'Description: "For non-urgent issues, billing inquiries, or detailed feedback."',
          ],
        ),
      ],
    );
  }
}

class ContactCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final List<String> details;

  const ContactCard({
    super.key,
    required this.icon,
    required this.title,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.green, size: 30),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style:
                        const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  ...details.map(
                    (line) => Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Text(
                        line,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
