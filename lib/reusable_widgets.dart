import 'package:flutter/material.dart';
import 'cart_screen.dart';
import 'main.dart';

class QCAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String? ic;

  QCAppbar({this.ic});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('QC'),
      centerTitle: true,

      actions: [
        if (ic == 'cart')
          IconButton(
            color: Colors.deepOrangeAccent,
            iconSize: 25,

            icon: const Icon(
              Icons.shopping_cart,
            ),

            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartScreen(),
                ),
              );
            },
          ),
        SizedBox(
          height: 30,
          child: FittedBox(
            child: Switch(
              value: Theme.of(context).brightness == Brightness.dark,

              thumbIcon: WidgetStateProperty.resolveWith<Icon?>(
                (Set<WidgetState> states) {
                  if (states.contains(WidgetState.selected)) {
                    return const Icon(
                      Icons.dark_mode,
                      color: Colors.orange,
                    );
                  }

                  return const Icon(Icons.light_mode);
                },
              ),

              onChanged: (value) {
                MyApp.of(context).changeTheme(value);
              },
            ),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: Localizations.localeOf(context).languageCode,

            borderRadius: BorderRadius.circular(15),

            items: const [
              DropdownMenuItem(
                value: 'en',
                child: Text('EN'),
              ),

              DropdownMenuItem(
                value: 'am',
                child: Text('AM'),
              ),
            ],

            onChanged: (value) {
              if (value != null) {
                MyApp.of(context).changeLanguage(value);
              }
            },
          ),
        ),
      ],
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
          100,
          10,
          100,
          10,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),

      onPressed: ontap,
      child: Text(
        txt,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w800,
          color: Colors.black,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
