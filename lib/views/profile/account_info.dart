import 'package:beethechef/models/user_model.dart';
import 'package:beethechef/utilities/constants.dart';
import 'package:beethechef/widgets/custom_appbar.dart';
import 'package:beethechef/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

class AccountInfo extends StatelessWidget {
  final UserModel userInfoModel;
  const AccountInfo({super.key, required this.userInfoModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppAssets.backgroundColor,
      appBar: CustomAppBarWidget(title: 'Account'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextWidget(
                text: 'Account info',
                fSize: 20,
                fWeight: FontWeight.w700,
              ),
              const SizedBox(height: 10),
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/saim.jpg'),
              ),
              const SizedBox(height: 10),
              CustomTextWidget(
                text: 'Basic info',
                fSize: 16,
                fWeight: FontWeight.w500,
              ),
              ReUsableAccountInfoWidget(
                infoType: 'Name',
                infoValue: userInfoModel.username,
              ),
              ReUsableAccountInfoWidget(
                infoType: 'Phone Number',
                infoValue: userInfoModel.userPhoneNumber.toString(),
              ),
              ReUsableAccountInfoWidget(
                infoType: 'Email',
                infoValue: userInfoModel.userEmail,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReUsableAccountInfoWidget extends StatelessWidget {
  final String infoType;
  final String infoValue;

  const ReUsableAccountInfoWidget({
    Key? key,
    required this.infoType,
    required this.infoValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextWidget(
            text: infoType,
            fSize: 16,
            fWeight: FontWeight.w300,
          ),
          const SizedBox(height: 5),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: infoValue,
                      hintStyle: const TextStyle(color: Colors.black87),
                      border: InputBorder.none,
                    ),
                    style: const TextStyle(color: Colors.black87),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
