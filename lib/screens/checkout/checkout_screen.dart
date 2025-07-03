import 'package:flutter/material.dart';
import 'package:flash_fuel/widgets/main_scaffold.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final _formKey = GlobalKey<FormState>();
  String fullName = '';
  String mobile = '';
  String email = '';
  String address = '';
  String paymentMethod = 'Cash on Delivery';

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      currentIndex: 1, // Cart tab
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Checkout"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Full Name"),
                const SizedBox(height: 4),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your full name',
                  ),
                  validator: (value) => value!.isEmpty ? 'Required' : null,
                  onSaved: (value) => fullName = value!,
                ),
                const SizedBox(height: 16),

                const Text("Mobile Number"),
                const SizedBox(height: 4),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your mobile number',
                  ),
                  validator: (value) => value!.isEmpty ? 'Required' : null,
                  onSaved: (value) => mobile = value!,
                ),
                const SizedBox(height: 16),

                const Text("Email Address"),
                const SizedBox(height: 4),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your email',
                  ),
                  validator: (value) => value!.isEmpty ? 'Required' : null,
                  onSaved: (value) => email = value!,
                ),
                const SizedBox(height: 16),

                const Text("Shipping Address"),
                const SizedBox(height: 4),
                TextFormField(
                  maxLines: 3,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your address',
                  ),
                  validator: (value) => value!.isEmpty ? 'Required' : null,
                  onSaved: (value) => address = value!,
                ),
                const SizedBox(height: 16),

                const Text("Payment Option"),
                const SizedBox(height: 8),
                Column(
                children: [
                  RadioListTile<String>(
                    title: const Text("Cash on Delivery"),
                    value: "Cash on Delivery",
                    groupValue: paymentMethod,
                    onChanged: (val) {
                      setState(() {
                        paymentMethod = val!;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: const Text("Pay with Card"),
                    value: "Pay with Card",
                    groupValue: paymentMethod,
                    onChanged: (val) {
                      setState(() {
                        paymentMethod = val!;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: const Text("Pay with Mobile Banking"),
                    value: "Pay with Mobile Banking",
                    groupValue: paymentMethod,
                    onChanged: (val) {
                      setState(() {
                        paymentMethod = val!;
                      });
                    },
                  ),
                ],
              ),
                const SizedBox(height: 24),

                SizedBox(
  width: double.infinity,
  height: 50,
  child: ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blueAccent,
    ),
    onPressed: () {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();

        // ✅ Redirect to order complete screen
        print('Navigating to order complete complete');
        Navigator.pushReplacementNamed(context, '/order_complete');
      }
    },
    child: const Text(
      "Confirm Order",
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ),
  ),
),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
