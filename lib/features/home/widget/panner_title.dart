import 'package:demo_products_apple/common/constans/colors.dart';
import 'package:demo_products_apple/common/constans/images.dart';
import 'package:demo_products_apple/common/widget/custom_text.dart';
import 'package:flutter/material.dart';

class BannerTitle extends StatelessWidget {
  const BannerTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Image.asset(
            ImagesApp.pannerTitle,
            fit: BoxFit.cover,
          ),
          Positioned(
            left: 20,
            top: 25,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: 'MacBook Pro',
                  fontSize: 25,
                  color: ColorsApp.firstColor,
                  fontWeight: FontWeight.bold,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    fixedSize: Size(140, 10),
                    backgroundColor: ColorsApp.firstColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {},
                  child: CustomText(
                    text: 'Tampilan Premeum',
                    fontSize: 14,
                    color: ColorsApp.secondColor,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 10,
            right: -5,
            child: Image.asset(ImagesApp.MacBookInpannerTitle),
          )
        ],
      ),
    );
  }
}
