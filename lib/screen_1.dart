import 'package:flutter/material.dart';
import 'data.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QC'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ImageSlider(),
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
                      'Cloud 9',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '\$245',
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
  ImageSlider({super.key});

  final _pageController = PageController(
    initialPage: 2,
    viewportFraction: 0.8,
  );

  final List<String> images = [
    'asset/images/qc_1.webp',
    'asset/images/qc_2.webp',
    'asset/images/qc_3.webp',
    'asset/images/qc_4.webp',
    'asset/images/qc_lightblue_pair.webp',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: PageView.builder(
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Image.asset(
            images[index],
            fit: BoxFit.cover,
          );
        },
        controller: _pageController,
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
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Text(size),
            ),
          );
        }).toList(),
      ),
    );
  }
}
