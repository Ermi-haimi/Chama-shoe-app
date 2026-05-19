import 'package:flutter/material.dart';
import 'cart_screen.dart';

class QCAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String? ic;

  QCAppbar({this.ic});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('QC'),
      centerTitle: true,
      actions: ic == 'cart'
          ? [
              IconButton(
                color: Colors.deepOrangeAccent,
                iconSize: 35,

                icon: Icon(
                  Icons.shopping_cart,
                ),

                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartScreen(),
                    ),
                  );
                },
              ),
            ]
          : [],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class LargeButton extends StatelessWidget {
  final VoidCallback ontap;
  final String txt;

  const LargeButton({required this.ontap, required this.txt});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.orange,
        padding: EdgeInsets.fromLTRB(
          60,
          10,
          60,
          10,
        ),
      ),

      onPressed: ontap,
      child: Text(
        txt,
      ),
    );
  }
}
