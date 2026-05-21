import 'package:chama_chama/reusable_widgets.dart';
import 'package:flutter/material.dart';
import 'shoe_data.dart';
import 'detailed_screen.dart';
import 'package:chama_chama/l10n/app_localizations.dart';

class HomeShoeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: QCAppbar(
        ic: 'cart',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              // color: Colors.transparent,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('asset/images/runners.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(23),
                  bottomRight: Radius.circular(23),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 20,
                    left: 10,
                    child: Text(
                      AppLocalizations.of(context)!.run,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 40,

                        fontFamily: 'NotoSerif',
                        shadows: [
                          Shadow(
                            color: Colors.black.withValues(alpha: 0.6),
                            blurRadius: 10,
                            offset: Offset(5, 5),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 6,
                    child: Text(
                      AppLocalizations.of(context)!.runLike,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 40,
                        fontFamily: 'NotoSerif',
                        shadows: [
                          Shadow(
                            color: Colors.black.withValues(alpha: 0.6),
                            blurRadius: 10,
                            offset: Offset(5, 5),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ShoeSelector(),
          ],
        ),
      ),
    );
  }
}

class ShoeSelector extends StatelessWidget {
  const ShoeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 0.7,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: allTheShoes.map((chama) {
        return ReuseableCard(
          kelem: Colors.transparent,
          onPress: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => DetailShoeScreen(
                  shoeObject: chama,
                ),
              ),
            );
          },
          childCard: Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              right: 8.0,
            ),
            child: Column(
              children: [
                Image.asset(
                  chama.mainImage,
                  fit: BoxFit.contain,
                ),
                Text(
                  chama.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.primary,
                    fontFamily: 'NotoSerif',
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '\$${chama.price.toString()}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -1,
                    color: Theme.of(context).textTheme.bodyLarge!.color,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

class ReuseableCard extends StatelessWidget {
  final Color kelem;
  final Widget? childCard;
  final VoidCallback? onPress;

  ReuseableCard({required this.kelem, required this.childCard, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: Theme.of(context).brightness == Brightness.dark
                ? [
                    Colors.grey.shade900,
                    Colors.grey.shade800,
                  ]
                : [
                    Colors.white,
                    Colors.brown.shade200,
                  ],
          ),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.3),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(15, 5),
            ),
          ],

          borderRadius: BorderRadius.circular(10),
        ),
        child: childCard,
      ),
    );
  }
}
