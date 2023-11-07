import 'package:beethechef/models/product_model.dart';
import 'package:beethechef/utilities/constants.dart';
import 'package:beethechef/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.product, required this.press});

  final ProductModel product;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(defaultPadding),
              decoration: BoxDecoration(
                color: product.color,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: "${product.id}",
                child: Image.asset(product.image),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding / 4),
            child: CustomTextWidget(
              text: product.title,
              textColor: AppAssets.textColor,
              fWeight: FontWeight.w500,
              fSize: 16,
            ),
          ),
          CustomTextWidget(
            text: "\$${product.price}",
            textColor: AppAssets.textLightColor,
            fWeight: FontWeight.w300,
            fSize: 14,
          )
        ],
      ),
    );
  }
}
