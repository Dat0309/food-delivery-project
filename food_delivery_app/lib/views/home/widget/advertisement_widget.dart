import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/big_text.dart';

class AdvertisementWidget extends StatefulWidget {
  const AdvertisementWidget({Key? key}) : super(key: key);

  @override
  State<AdvertisementWidget> createState() => _AdvertisementWidgetState();
}

class _AdvertisementWidgetState extends State<AdvertisementWidget> {
  final List<String> ads = [
    'assets/images/ad.jpg',
    'assets/images/ad2.jpg',
    'assets/images/ad3.jpg',
    'assets/images/ad4.jpg',
    'assets/images/ad5.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
            left: Dimensions.widthPadding25,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const BigText(
                text: 'Thông tin sự kiện',
              ),
              SizedBox(
                width: Dimensions.widthPadding10,
              ),
            ],
          ),
        ),
        SizedBox(
          height: Dimensions.heightPadding20,
        ),
        CarouselSlider.builder(
          itemCount: 5,
          options: CarouselOptions(
            viewportFraction: 0.8,
            initialPage: 0,
            height: Dimensions.height140 + 20,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
          ),
          itemBuilder: (BuildContext context, int index, int pageViewIndex) {
            return GestureDetector(
              onTap: () {},
              child: Stack(alignment: Alignment.bottomLeft, children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.6),
                        offset: const Offset(
                          0.0,
                          10.0,
                        ),
                        blurRadius: 10.0,
                        spreadRadius: -6.0,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    child: Image.asset(
                      ads[index],
                      fit: BoxFit.cover,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ]),
            );
          },
        )
      ],
    );
  }
}
