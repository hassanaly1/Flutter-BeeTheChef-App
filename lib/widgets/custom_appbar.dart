// ignore_for_file: non_constant_identifier_names

import 'package:beethechef/utilities/constants.dart';
import 'package:beethechef/views/cart_and_checkout/cart_screen.dart';
import 'package:beethechef/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

AppBar CustomAppBarWidget(
    {required String title,
    List<Widget>? action,
    bool? automaticallyImplyLeading}) {
  return AppBar(
    automaticallyImplyLeading: automaticallyImplyLeading ?? true,
    leading: IconButton(
      icon: SvgPicture.asset(
        "assets/icons/back.svg",
        colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
      ),
      onPressed: () {
        Get.back();
      },
    ),
    title: CustomTextWidget(text: title, fSize: 16.0, fWeight: FontWeight.w700),
    centerTitle: true,
    backgroundColor: AppAssets.primaryColor,
    elevation: 0,
    actions: [
      IconButton(
        icon: SvgPicture.asset(
          "assets/icons/search.svg",
          colorFilter:
              const ColorFilter.mode(AppAssets.textColor, BlendMode.srcIn),
        ),
        onPressed: () {},
      ),
      IconButton(
        icon: SvgPicture.asset(
          "assets/icons/cart.svg",
          colorFilter:
              const ColorFilter.mode(AppAssets.textColor, BlendMode.srcIn),
        ),
        onPressed: () {
          Get.to(const CartScreen(), transition: Transition.upToDown);
        },
      ),
      const SizedBox(width: defaultPadding / 2)
    ],
  );
}
