import 'package:chama_chama/reusable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';
import 'package:chama_chama/l10n/app_localizations.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartItems = context.watch<CartProvider>().items;
    var l = cartItems.length;
    final local = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: QCAppbar(),
      body: l > 0
          ? Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,

                    itemBuilder: (context, index) {
                      final item = cartItems[index];

                      return Padding(
                        padding: const EdgeInsets.all(12),

                        child: Row(
                          children: [
                            Image.asset(
                              item.shoe.mainImage,
                              height: 120,
                              width: 120,
                              fit: BoxFit.cover,
                            ),

                            SizedBox(width: 15),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  Text(
                                    item.shoe.name,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  SizedBox(height: 8),

                                  Text('${local.size}: ${item.size}'),

                                  Text(
                                    '${local.quantity}: ${item.quantity}',
                                  ),

                                  SizedBox(height: 8),

                                  Text(
                                    '\$${item.shoe.price * item.quantity}',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                context.read<CartProvider>().removeItem(index);
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                LargeButton(ontap: () {}, txt: local.checkout),
                SizedBox(
                  height: 10,
                ),
              ],
            )
          : Center(
              child: Text(
                local.emptyCart,
                style: TextStyle(
                  fontSize: 40,
                  // fontWeight: FontWeight.bold,
                  letterSpacing: -3,
                  color: Colors.orange,
                ),
                textAlign: TextAlign.center,
              ),
            ),
    );
  }
}
