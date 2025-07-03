import 'package:flutter/material.dart';
import 'package:flash_fuel/widgets/main_scaffold.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      currentIndex: 0,
      child: Column(
        children: [
          AppBar(
            title: const Text(
              'FAQs',
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
              child: FAQContent(),
            ),
          ),
        ],
      ),
    );
  }
}

class FAQContent extends StatelessWidget {
  const FAQContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        FAQSection(
          title: 'Ordering & Delivery',
          faqs: [
            FAQItem(
              question: 'How do I place an order?',
              answer:
                  'Go to the Home screen, tap "Add to cart" then go to cart, press the product, then confirm your location, and proceed to payment.',
            ),
            FAQItem(
              question: 'How long does a delivery take?',
              answer:
                  'Standard deliveries are completed within 1–2 hours. For immediate needs, please use our "Emergency Service" for delivery within 30 minutes.',
            ),
            FAQItem(
              question: 'Can I schedule a delivery for a later time?',
              answer: 'No. At least not yet. We’ll add a schedule delivery option later!',
            ),
            FAQItem(
              question: 'How do I track my order?',
              answer:
                  'Tracking not available yet. We are building our app to support fully tracking order with open street map.',
            ),
            FAQItem(
              question: 'What are your service hours?',
              answer:
                  'Our standard delivery service operates from 8 AM to 10 PM every day. Emergency services are available 24/7.',
            ),
          ],
        ),
        FAQSection(
          title: 'Payments & Pricing',
          faqs: [
            FAQItem(
              question: 'What payment methods do you accept?',
              answer:
                  'We accept bKash, Nagad, Rocket, Debit/Credit Cards (Visa, Mastercard), and Cash on Delivery (COD).',
            ),
            FAQItem(
              question: 'Is the fuel price the same as at the petrol pump?',
              answer:
                  'The fuel price is based on the current government-mandated rate. A nominal delivery and service charge is added to each order.',
            ),
            FAQItem(
              question: 'How do I use a promo code?',
              answer:
                  'We are working on discounts and promo codes for better user experience! It will be available very soon.',
            ),
            FAQItem(
              question: 'My payment failed but the money was deducted. What do I do?',
              answer:
                  'Please do not worry. Contact our support team immediately via Live Chat or phone. We will resolve the issue within 24 hours.',
            ),
          ],
        ),
        FAQSection(
          title: 'Safety & Quality',
          faqs: [
            FAQItem(
              question: 'Is the fuel you provide good quality?',
              answer:
                  'Absolutely. We source our fuel directly from officially recognized distribution depots and ensure it is transported in sealed, government-approved containers.',
            ),
            FAQItem(
              question: 'Are your delivery methods safe?',
              answer:
                  'Yes. Our riders are professionally trained and use specialized, calibrated dispensing units with safety features to prevent spills and ensure accurate measurement.',
            ),
          ],
        ),
        FAQSection(
          title: 'My Account & Vehicles',
          faqs: [
            FAQItem(
              question: 'How do I add my vehicle?',
              answer:
                  'Go to "My Vehicles" from the menu and tap "Add Vehicle." You can add your car or motorcycle\'s details for faster ordering next time.',
            ),
            FAQItem(
              question: 'How do I reset my password?',
              answer:
                  'On the login screen, tap "Forgot Password" and follow the instructions sent to your registered mobile number.',
            ),
          ],
        ),
      ],
    );
  }
}

class FAQSection extends StatelessWidget {
  final String title;
  final List<FAQItem> faqs;

  const FAQSection({
    super.key,
    required this.title,
    required this.faqs,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        ...faqs,
      ],
    );
  }
}

class FAQItem extends StatelessWidget {
  final String question;
  final String answer;

  const FAQItem({
    super.key,
    required this.question,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text("• ", style: TextStyle(fontSize: 18)),
              Expanded(
                child: Text(
                  question,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18, top: 4),
            child: Text(
              'Answer: $answer',
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
