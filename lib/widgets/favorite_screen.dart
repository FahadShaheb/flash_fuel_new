import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/product.dart';
import '../../providers/favorite_provider.dart';
import '../../widgets/main_scaffold.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    final favorites = favoriteProvider.favorites;

    return MainScaffold(
      currentIndex: 3, // Set appropriately based on your nav bar
      child: Scaffold(
        appBar: AppBar(
          title: const Text("My Favorites"),
        ),
        body: favorites.isEmpty
            ? const Center(child: Text("No favorites added yet."))
            : ListView.builder(
                itemCount: favorites.length,
                itemBuilder: (context, index) {
                  final product = favorites[index];
                  return Dismissible(
                    key: Key(product.name),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
                    onDismissed: (_) {
                      favoriteProvider.removeFavorite(product);
                    },
                    child: Card(
                      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(product.imageUrl, width: 50, height: 50, fit: BoxFit.cover),
                        ),
                        title: Text(product.name),
                        subtitle: Text("৳ ${product.price.toStringAsFixed(1)}"),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
