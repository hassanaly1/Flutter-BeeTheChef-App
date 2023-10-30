import 'package:beethechef/models/product_model.dart';
import 'package:beethechef/views/details/components/cart_counter.dart';
import 'package:beethechef/views/details/details_screen.dart';
import 'package:beethechef/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class CustomProductContainer extends StatelessWidget {
  final int index;
  const CustomProductContainer({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          DetailsScreen(product: products[index]),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          height: Get.height * 0.15,
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(22.0)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                // height: Get.height * 0.1,
                width: 100,
                decoration: BoxDecoration(
                    color: products[index].color,
                    borderRadius: BorderRadius.circular(22.0)),
                child: Hero(
                  tag: "${products[index].id}",
                  child: Image.asset(products[index].image),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                    text: products[index].title,
                    fSize: 16,
                    fWeight: FontWeight.w500,
                  ),
                  CustomTextWidget(
                    text: 'Size: ${products[index].size.toString()}',
                    fSize: 14,
                    fWeight: FontWeight.w500,
                    maxLines: 1,
                  ),
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 20.0,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      //print(rating);
                    },
                  ),
                  CustomTextWidget(
                    text: 'Price: ${products[index].price.toString()}',
                    fSize: 14,
                    fWeight: FontWeight.w500,
                  ),
                ],
              ),
              const CartCounter()
            ],
          ),
        ),
      ),
    );
  }
}
