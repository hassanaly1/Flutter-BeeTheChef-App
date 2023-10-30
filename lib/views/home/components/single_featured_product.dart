import 'package:beethechef/models/product_model.dart';
import 'package:beethechef/utilities/constants.dart';
import 'package:beethechef/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleFeaturedProductWidget extends StatelessWidget {
  final int index;

  const SingleFeaturedProductWidget({
    super.key,
    required this.topRatedProducts,
    required this.index,
  });

  final List<ProductModel> topRatedProducts;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: Get.width * 0.5,
          margin: const EdgeInsets.all(6.0),
          child: Card(
            elevation: 10.0,
            semanticContainer: false,
            color: Colors.grey.shade100,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.favorite_outline)),
                  ),
                  Center(
                    child: Image.asset(
                      products[index].image,
                      height: 70,
                    ),
                  ),
                  CustomTextWidget(
                    text: products[index].title,
                    fSize: 18,
                    fWeight: FontWeight.w500,
                    maxLines: 1,
                    textColor: AppAssets.textColor,
                  ),
                  CustomTextWidget(
                    text: 'Price: ${products[index].price.toString()}',
                    fSize: 14,
                    fWeight: FontWeight.w300,
                    textColor: AppAssets.textLightColor,
                  ),
                  CustomTextWidget(
                    text: 'Size: ${products[index].size.toString()}',
                    fSize: 14,
                    fWeight: FontWeight.w300,
                    textColor: AppAssets.textLightColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
