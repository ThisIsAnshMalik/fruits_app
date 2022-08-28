import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  BannerWidget({Key? key}) : super(key: key);
  var bannerItem = ["Apple", "Grapes", "Mango", "Lemon", "Watermelon"];
  var bannerImage = [
    "assets/apple.png",
    "assets/grapes.png",
    "assets/mango.png",
    "assets/lemon.png",
    "assets/watermelon.png",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 87,
      child: Align(
        alignment: Alignment.topCenter,
        child: ListView.builder(
          itemCount: bannerItem.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            return Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                      left: 5, right: 10, top: 5, bottom: 2),
                  height: 64,
                  width: 64,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      bannerImage[index],
                    ),
                  ),
                ),
                Text(
                  bannerItem[index],
                  style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w500),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
