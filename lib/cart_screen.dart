import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartItems = context.watch<CartProvider>().items;

    return Scaffold(
      body: ListView.builder(
        itemCount: cartItems.length,

        itemBuilder: (context, index) {
          final item = cartItems[index];

          return ListTile(
            leading: Image.asset(
              item.shoe.mainImage,
              height: 250,
            ),
            title: Text(item.shoe.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Size: ${item.size}',
                ),
                Text(
                  'Quantity: ${item.quantity}',
                ),
              ],
            ),
            trailing: Text(
              '\$${item.shoe.price * item.quantity}',
            ),
          );
        },
      ),
    );
  }
}
