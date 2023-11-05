import 'package:demo_products_apple/common/Models/category_model.dart';
import 'package:demo_products_apple/common/constans/colors.dart';
import 'package:demo_products_apple/common/widget/custom_text.dart';
import 'package:demo_products_apple/features/providers/tabs_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class CategoryWidget extends ConsumerWidget {
  CategoryWidget({super.key, required this.categoryModel, required this.index});
  CategoryModel categoryModel;
  int index;

  @override
  Widget build(BuildContext context, ref) {
    final tabProvider = ref.watch(tabsProvider);
    return InkWell(
      onTap: () {
        ref.watch(tabsProvider.notifier).selectNewIndext(index);
      },
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(10),
        width: 90,
        decoration: BoxDecoration(
          color: tabProvider != index
              ? ColorsApp.firstColor
              : ColorsApp.secondColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            SvgPicture.asset(
              categoryModel.iconPath,
              height: 30,
              color: tabProvider != index
                  ? ColorsApp.secondColor
                  : ColorsApp.firstColor,
            ),
            SizedBox(
              height: 8,
            ),
            CustomText(
              text: categoryModel.name,
              color: tabProvider != index
                  ? ColorsApp.secondColor
                  : ColorsApp.firstColor,
              fontSize: 15,
            )
          ],
        ),
      ),
    );
  }
}
