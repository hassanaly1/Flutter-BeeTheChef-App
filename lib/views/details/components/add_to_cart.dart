import 'package:beethechef/models/product_model.dart';
import 'package:beethechef/utilities/constants.dart';
import 'package:beethechef/views/cart_and_checkout/cart_screen.dart';
import 'package:beethechef/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({super.key, required this.product});

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: Row(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: defaultPadding),
            height: 50,
            width: 58,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: product.color,
              ),
            ),
            child: IconButton(
              icon: SvgPicture.asset(
                "assets/icons/add_to_cart.svg",
                colorFilter: ColorFilter.mode(product.color, BlendMode.srcIn),
              ),
              onPressed: () {
                Get.to(const CartScreen());
              },
            ),
          ),
          CustomButton(
            buttonText: 'BUY NOW',
            onTap: () {},
          )
        ],
      ),
    );
  }
}
