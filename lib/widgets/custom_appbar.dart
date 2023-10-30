// ignore_for_file: non_constant_identifier_names

import 'package:beethechef/utilities/constants.dart';
import 'package:beethechef/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

AppBar CustomAppBarWidget(
    {required String title,
    bool? automaticallyImplyLeading,
    List<Widget>? actions}) {
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
      title:
          CustomTextWidget(text: title, fSize: 16.0, fWeight: FontWeight.w700),
      centerTitle: true,
      backgroundColor: AppAssets.primaryColor,
      elevation: 0,
      actions: actions);
}
