import 'package:flutter/material.dart';
import 'shoe_model.dart';
import 'shoe_data.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DetailShoeScreen extends StatelessWidget {
  final Shoe shoeObject;

  DetailShoeScreen({required this.shoeObject});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QC'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ImageSlider(images: shoeObject.images),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Men\'s Shoe',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                    Text('4.5'),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      shoeObject.name,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '\$${shoeObject.price}',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Size',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ShoeSizeTypeByCountry(
                              country: 'US',
                              onTap: () {},
                            ),
                            ShoeSizeTypeByCountry(
                              country: 'UK',
                              onTap: () {},
                            ),
                            ShoeSizeTypeByCountry(
                              country: 'EU',
                              onTap: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                ShoeSizeSelector(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ShoeSizeTypeByCountry extends StatelessWidget {
  final String country;
  final VoidCallback onTap;

  const ShoeSizeTypeByCountry({required this.country, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.all(5),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: Size.zero,
      ),
      onPressed: onTap,
      child: Text(
        country,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

class ImageSlider extends StatelessWidget {
  final List<String> images;

  ImageSlider({required this.images});

  final _pageController = PageController(
    // viewportFraction: 0.9,
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
          ),
        ),

        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                // scrollDirection: Axis.horizontal,
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return Image.asset(
                    images[index],
                    fit: BoxFit.cover,
                  );
                },
                controller: _pageController,
              ),
            ),
            SmoothPageIndicator(
              controller: _pageController,
              count: images.length,
              effect: WormEffect(),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class ShoeSizeSelector extends StatelessWidget {
  const ShoeSizeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: shoeSize.map((size) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                // backgroundColor: Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                side: BorderSide(color: Colors.orange),
              ),
              child: Text(size),
            ),
          );
        }).toList(),
      ),
    );
  }
}
