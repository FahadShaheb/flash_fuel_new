import 'package:flutter/material.dart';
import 'package:flash_fuel/widgets/main_scaffold.dart';

class OffersAndPromotionsScreen extends StatelessWidget {
  const OffersAndPromotionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      currentIndex: 0, // Adjust as needed for your nav bar
      child: Column(
        children: [
          AppBar(
            title: const Text(
              'Offers & Promotions',
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
          const Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 150,
                    child: Image(
                      image: AssetImage('assets/images/comingsoon.jpg'),
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "No promotions available at the moment.",
                    style: TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
