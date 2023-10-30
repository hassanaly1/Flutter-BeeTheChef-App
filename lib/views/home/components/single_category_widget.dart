import 'package:beethechef/models/categories_model.dart';
import 'package:beethechef/views/category/catogories_detail_screen.dart';
import 'package:beethechef/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleCategoryWidget extends StatelessWidget {
  final int index;
  const SingleCategoryWidget({
    super.key,
    required this.categories,
    required this.index,
  });

  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      width: Get.width * 0.35,
      // color: Colors.amber,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: Get.height * 0.2,
            width: Get.width * 0.3,
            padding: const EdgeInsets.all(12.0),
            margin: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffFFAE42),
            ),
            child: InkWell(
              onTap: () {
                Get.to(
                    CategoryDetailScreen(
                      categoryName: categories[index].name,
                    ),
                    transition: Transition.rightToLeft);
              },
              child: Image.asset(
                categories[index].image,
                height: 70,
              ),
            ),
          ),
          CustomTextWidget(
            text: categories[index].name,
            fSize: 18,
            fWeight: FontWeight.w600,
            maxLines: 2,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
