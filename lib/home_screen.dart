import 'package:flutter/material.dart';
import 'shoe_data.dart';
import 'detailed_screen.dart';

class HomeShoeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('QC'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              color: Colors.transparent,
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
                    fontSize: 23,
                    color: Colors.blueAccent[700],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '\$${chama.price.toString()}',
                  style: TextStyle(
                    fontSize: 20,
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
          gradient: LinearGradient(colors: [Colors.white, Colors.brown]),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.3),
              spreadRadius: 2,
              blurRadius: 10,
              offset: Offset(15, 5),
            ),
          ],
          // color: kelem,
          borderRadius: BorderRadius.circular(10),
          // border: Border.all(color: Colors.blue, width: 1),
        ),
        child: childCard,
      ),
    );
  }
}
