import 'package:chama_chama/cart_screen.dart';
import 'package:chama_chama/reusable_widgets.dart';
import 'package:flutter/material.dart';
import 'shoe_model.dart';
import 'shoe_data.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'cart_shoe_model.dart';
import 'cart_provider.dart';
import 'package:provider/provider.dart';

List<String> shoeSize = shoeSizeEu;

enum Country {
  UK,
  EU,
  US,
}

Country selectedCountry = Country.EU;
String selectedSize = shoeSize[0];

class DetailShoeScreen extends StatefulWidget {
  final Shoe shoeObject;

  DetailShoeScreen({required this.shoeObject});

  @override
  State<DetailShoeScreen> createState() => _DetailShoeScreenState();
}

class _DetailShoeScreenState extends State<DetailShoeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: QCAppbar(
        ic: 'cart',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ImageSlider(images: widget.shoeObject.images),
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
                        widget.shoeObject.name,
                        style: TextStyle(
                          color: Colors.deepOrangeAccent,
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '\$${widget.shoeObject.price}',
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
                                weight: selectedCountry == Country.US
                                    ? FontWeight.w900
                                    : FontWeight.w300,
                                country: 'US',
                                onTap: () {
                                  setState(() {
                                    shoeSize = shoeSizeUs;
                                    selectedCountry = Country.US;
                                  });
                                },
                              ),
                              ShoeSizeTypeByCountry(
                                weight: selectedCountry == Country.UK
                                    ? FontWeight.w600
                                    : FontWeight.w300,
                                country: 'UK',
                                onTap: () {
                                  setState(() {
                                    shoeSize = shoeSizeUk;
                                    selectedCountry = Country.UK;
                                  });
                                },
                              ),
                              ShoeSizeTypeByCountry(
                                weight: selectedCountry == Country.EU
                                    ? FontWeight.w600
                                    : FontWeight.w300,
                                country: 'EU',
                                onTap: () {
                                  setState(() {
                                    shoeSize = shoeSizeEu;
                                    selectedCountry = Country.EU;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  ShoeSizeSelector(),
                  SizedBox(
                    height: 20,
                  ),
                  ExpansionTile(
                    title: Text(
                      'Description',
                    ),
                    children: [
                      Padding(
                        padding: EdgeInsetsGeometry.all(8),
                        child: Text(widget.shoeObject.description),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  LargeButton(
                    txt: 'Add to Cart',
                    ontap: () {
                      context.read<CartProvider>().addToCart(
                        shoe: widget.shoeObject,
                        size: selectedSize,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShoeSizeTypeByCountry extends StatelessWidget {
  final String country;
  final VoidCallback onTap;
  final FontWeight weight;

  const ShoeSizeTypeByCountry({
    required this.country,
    required this.onTap,
    required this.weight,
  });

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
          fontSize: 17,
          fontWeight: weight,
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
      height: 400,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 2,
              color: Colors.orange.withValues(alpha: 0.3),
            ),
          ),
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

class ShoeSizeSelector extends StatefulWidget {
  @override
  State<ShoeSizeSelector> createState() => _ShoeSizeSelectorState();
}

class _ShoeSizeSelectorState extends State<ShoeSizeSelector> {
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
              onPressed: () {
                setState(() {
                  selectedSize = size;
                });
              },
              style: TextButton.styleFrom(
                backgroundColor: selectedSize == size
                    ? Colors.orange[300]
                    : Colors.transparent,
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
