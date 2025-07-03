import 'package:flash_fuel/models/product.dart';
import 'package:flash_fuel/providers/cart_provider.dart';
import 'package:flash_fuel/providers/favorite_provider.dart';
import 'package:flash_fuel/screens/auth/authcheckscreen.dart';
import 'package:flash_fuel/screens/cart/cart_screen.dart';
import 'package:flash_fuel/screens/checkout/checkout_complete.dart';
import 'package:flash_fuel/screens/checkout/checkout_screen.dart';
import 'package:flash_fuel/screens/help_support.dart';
import 'package:flash_fuel/screens/my_account.dart';
import 'package:flash_fuel/screens/my_orders.dart';
import 'package:flash_fuel/screens/my_vehicle_screen.dart';
import 'package:flash_fuel/screens/my_wallet.dart';
import 'package:flash_fuel/screens/personal_info_screen.dart';
import 'package:flash_fuel/widgets/chat_screen.dart';
import 'package:flash_fuel/widgets/contactus.dart';
import 'package:flash_fuel/widgets/faq.dart';
import 'package:flash_fuel/widgets/favorite_screen.dart';
import 'package:flash_fuel/widgets/main_scaffold.dart';
import 'package:flash_fuel/widgets/offer_promotions.dart';
import 'package:flash_fuel/widgets/product_details_screen.dart';
//import 'package:flash_fuel/screens/home/home_screen.dart';
import 'package:flash_fuel/widgets/product_list.dart';
import 'package:flash_fuel/widgets/terms_condition_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flash_fuel/screens/auth/login_screen.dart';
import 'package:flash_fuel/screens/auth/signup_screen.dart';
import 'package:flash_fuel/theme/app_theme.dart';
import 'package:provider/provider.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: const FlashFuelApp(),
    ),
  );
}

class FlashFuelApp extends StatelessWidget {
  const FlashFuelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flash Fuel',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const AuthCheckScreen(), // 👈 use this instead of initialRoute
      routes: {
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/cart': (context) => const CartScreen(),
        '/product_list': (context) => const ProductList(),
        '/home': (context) => const ProductList(), // Already using MainScaffold
        '/checkout': (context) => const CheckoutScreen(),
        '/order_complete': (context) => const OrderCompleteScreen(),
        '/favorites': (context) => const FavoriteScreen(),
        '/account': (context) => const AccountScreen(),
        '/my_orders': (context) => const MyOrdersScreen(),
        '/my_wallet': (context) => const MyWalletScreen(),
        '/offers_promotions': (context) => const OffersAndPromotionsScreen(),
        '/help_support': (context) => const HelpSupportScreen(),
        '/faq' : (context) => const FAQScreen(),
        '/contact_us': (context) => const ContactUsScreen(),
        '/my_vehicles': (context) => const MyVehiclesScreen(),
        '/information': (context) => const PersonalInfoScreen(),
        '/chat': (context) => const ChatScreen(),
        '/terms_and_privacy_policy': (context) => const TermsConditionsScreen(),
       // '/cart': (context) => MainScaffold(currentIndex: 1, child: CartScreen()),
       // '/chat': (context) => MainScaffold(currentIndex: 2, child: ChatScreen()),
       // '/account': (context) => MainScaffold(currentIndex: 3, child: AccountScreen()),
      },
      onGenerateRoute: (settings) {
    if (settings.name == '/product_details') {
      final product = settings.arguments as Product;
      return MaterialPageRoute(
        builder: (context) => ProductDetailsScreen(product: product),
      );
    }
    return null; // fallback
  },
    );
  }
}