import 'package:demo_products_apple/common/constans/colors.dart';
import 'package:demo_products_apple/common/constans/icons.dart';
import 'package:demo_products_apple/common/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // row for logo ind name
          Row(
            children: [
              SvgPicture.asset(
                IconsApp.logoApple,
                height: 35,
              ),
              SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: CustomText(
                  text: 'iStore',
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          // row notifiction and profile
          Row(
            children: [
              Container(
                height: 38,
                width: 38,
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                    color: ColorsApp.firstColor,
                    borderRadius: BorderRadius.circular(50)),
                child: SvgPicture.asset(
                  IconsApp.notifyIcon,
                ),
              ),
              SizedBox(
                width: 7,
              ),
              CircleAvatar(
                backgroundColor: ColorsApp.firstColor,
                child: Icon(
                  Icons.person,
                  color: ColorsApp.secondColor,
                  size: 30,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
