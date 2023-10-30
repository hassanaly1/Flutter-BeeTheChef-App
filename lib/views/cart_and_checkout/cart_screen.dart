import 'package:beethechef/models/product_model.dart';
import 'package:beethechef/utilities/constants.dart';
import 'package:beethechef/views/cart_and_checkout/checkout_screen.dart';
import 'package:beethechef/views/multiple_products/components/custom_product_container.dart';
import 'package:beethechef/widgets/custom_appbar.dart';
import 'package:beethechef/widgets/custom_button.dart';
import 'package:beethechef/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(title: 'Cart'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: products.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return CustomProductContainer(
                      index: index,
                    );
                  },
                )),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          padding: const EdgeInsets.all(12.0),
          height: Get.height * 0.15,
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(20.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: context.width * 0.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextWidget(
                          text: 'SubTotal: ',
                          textColor: AppAssets.textLightColor,
                          fSize: 18,
                          fWeight: FontWeight.w400,
                        ),
                        CustomTextWidget(
                          text: '200.00',
                          textColor: AppAssets.textColor,
                          fSize: 18,
                          fWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextWidget(
                          text: 'Shipping: ',
                          textColor: AppAssets.textLightColor,
                          fSize: 18,
                          fWeight: FontWeight.w400,
                        ),
                        CustomTextWidget(
                          text: '50.00',
                          textColor: AppAssets.textColor,
                          fSize: 18,
                          fWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextWidget(
                          text: 'Total: ',
                          textColor: AppAssets.textLightColor,
                          fSize: 18,
                          fWeight: FontWeight.w400,
                        ),
                        CustomTextWidget(
                          text: '250.00',
                          textColor: AppAssets.textColor,
                          fSize: 18,
                          fWeight: FontWeight.w400,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              CustomButton(
                buttonText: 'Checkout',
                width: context.width * 0.3,
                onTap: () {
                  Get.to(const CheckoutScreen(),
                      transition: Transition.rightToLeft);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
