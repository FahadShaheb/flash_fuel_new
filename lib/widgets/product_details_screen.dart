import 'package:flash_fuel/screens/cart/cartItem.dart';
import 'package:flutter/material.dart';
import '../../models/product.dart';
import '../../widgets/main_scaffold.dart';
import 'package:provider/provider.dart';
import '../../providers/cart_provider.dart';


class ProductDetailsScreen extends StatefulWidget {
  final Product product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final product = widget.product;

    return MainScaffold(
      currentIndex: 0,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back button
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),

              // Product image
              Center(
                child: Image.asset(
                  product.imageUrl,
                  height: 200,
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 12),

              // Rating and Favorite
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.star, color: Colors.green, size: 16),
                        SizedBox(width: 4),
                        Text('5/5'),
                      ],
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_border, color: Colors.grey),
                    label: const Text('Add to favorites', style: TextStyle(color: Colors.grey)),
                  ),
                ],
              ),

              const SizedBox(height: 8),
              Text(
                product.name,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              Text(
                'Price: ৳${product.price.toStringAsFixed(0)} BDT',
                style: const TextStyle(fontSize: 16, color: Colors.black54),
              ),

              const SizedBox(height: 12),

              // Quantity & Buy Now
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () {
                            if (quantity > 1) {
                              setState(() => quantity--);
                            }
                          },
                        ),
                        Text(quantity.toString(), style: const TextStyle(fontSize: 16)),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () => setState(() => quantity++),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                        onPressed: () {
                          for (int i = 0; i < quantity; i++) {
                            cart.addToCart(CartItem(
                              name: product.name,
                              price: product.price,
                              image: product.imageUrl,
                            ));
                          }
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('${product.name} added to cart!')),
                          );
                        },
                        child: const Text('Buy Now'),
                      ),
                    ),
                  )
                ],
              ),

              const SizedBox(height: 16),

              // Description
              const Text('Description', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              Text(product.description),

              const SizedBox(height: 16),

              // Details
              const Text('Details', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              _detailItem('Country Of Import', product.importCountry),
              _detailItem('Country Of Origin', product.originCountry),
              _detailItem('Unit Size', product.unitSize),
              _detailItem('SAE', product.sae),
              _detailItem('API', product.api),
              _detailItem('ACEA', product.acea),
              _detailItem('Appropriate Use', product.use),
              _detailItem('Oil Type', product.oilType),

              const SizedBox(height: 16),

              // Reviews section
              const Text('Reviews', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              Row(
                children: const [
                  Icon(Icons.sentiment_dissatisfied, color: Colors.grey),
                  SizedBox(width: 6),
                  Text('No reviews yet', style: TextStyle(color: Colors.grey)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _detailItem(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$title: ', style: const TextStyle(fontWeight: FontWeight.w600)),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}