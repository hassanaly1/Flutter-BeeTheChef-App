import 'package:beethechef/models/product_model.dart';
import 'package:beethechef/views/home/components/single_featured_product.dart';
import 'package:beethechef/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSection extends StatelessWidget {
  final String heading;
  final VoidCallback onTap;
  const CustomSection({super.key, required this.heading, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextWidget(
                  text: heading, fSize: 20, fWeight: FontWeight.w700),
              InkWell(
                onTap: onTap,
                child: CustomTextWidget(
                    text: 'See All', fSize: 16, fWeight: FontWeight.w400),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: Get.height * 0.28,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: products.length,
              itemBuilder: (context, index) {
                return SingleFeaturedProductWidget(
                  topRatedProducts: products,
                  index: index,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
