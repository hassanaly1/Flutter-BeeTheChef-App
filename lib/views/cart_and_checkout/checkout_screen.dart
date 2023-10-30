import 'package:beethechef/models/product_model.dart';
import 'package:beethechef/utilities/constants.dart';
import 'package:beethechef/widgets/custom_appbar.dart';
import 'package:beethechef/widgets/custom_button.dart';
import 'package:beethechef/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(title: 'Checkout'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const CustomRowWidget(
                text1: 'Your Address',
                text2: 'Change Address',
              ),
              SizedBox(height: context.height * 0.01),
              Container(
                padding: const EdgeInsets.all(8.0),
                height: Get.height * 0.15,
                width: context.width * 0.9,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12.0)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(text: 'Name: John Doe'),
                    CustomTextWidget(
                        text: 'Address: 1096 Bridge Avenue,  Jetson, USA'),
                    CustomTextWidget(text: 'Phone: +1  337-653-9841'),
                  ],
                ),
              ),
              SizedBox(height: context.height * 0.01),
              const CustomRowWidget(
                text1: 'Shipping Mode',
                text2: 'Change Mode',
              ),
              SizedBox(height: context.height * 0.01),
              Container(
                padding: const EdgeInsets.all(8.0),
                height: Get.height * 0.07,
                width: context.width * 0.9,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomTextWidget(text: 'Flat Rate'),
                    CustomTextWidget(text: '\$20.0'),
                  ],
                ),
              ),
              SizedBox(height: context.height * 0.01),
              const CustomRowWidget(
                text1: 'Your Cart',
                text2: 'View All',
              ),
              SizedBox(height: context.height * 0.01),
              SizedBox(
                height: Get.height * 0.2,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: context.height * 0.17,
                        width: context.width * 0.35,
                        padding: const EdgeInsets.all(defaultPadding),
                        decoration: BoxDecoration(
                          color: products[index].color,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Hero(
                          tag: "${products[index].id}",
                          child: Image.asset(products[index].image),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: context.height * 0.01),
              const CustomRowWidget(
                text1: 'Payment',
                text2: '',
              ),
              const Row(
                children: [
                  CustomPayment(image: 'assets/images/visa.png'),
                  CustomPayment(image: 'assets/images/mastercard.png'),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          padding: const EdgeInsets.all(12.0),
          height: Get.height * 0.1,
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(20.0)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
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
              CustomButton(
                buttonText: 'Pay',
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

class CustomPayment extends StatelessWidget {
  final String image;
  const CustomPayment({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        height: context.height * 0.1,
        width: context.width * 0.3,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Image.asset(image),
      ),
    );
  }
}

class CustomRowWidget extends StatelessWidget {
  final String text1;
  final String text2;
  const CustomRowWidget({
    super.key,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomTextWidget(
          text: text1,
          fSize: 16.0,
        ),
        CustomTextWidget(
          text: text2,
          textColor: AppAssets.textLightColor,
          fSize: 14.0,
        ),
      ],
    );
  }
}
