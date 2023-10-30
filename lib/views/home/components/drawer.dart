import 'package:beethechef/models/user_model.dart';
import 'package:beethechef/views/profile/account_info.dart';
import 'package:beethechef/views/profile/notification_screen.dart';
import 'package:beethechef/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  UserModel userInfoModel = UserModel(
    username: 'Andrew Smith',
    userEmail: 'andrew@gmail.com',
    userProfilePicture: 'assets/saim.jpg',
    userPhoneNumber: 1234567890,
  );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListTileTheme(
        textColor: Colors.white,
        iconColor: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 128.0,
              height: 128.0,
              margin: const EdgeInsets.only(
                top: 24.0,
                bottom: 64.0,
              ),
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                color: Colors.black26,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                'assets/images/saim.jpg',
              ),
            ),
            ListTile(
              onTap: () => Get.to(
                  AccountInfo(
                    userInfoModel: userInfoModel,
                  ),
                  transition: Transition.upToDown),
              leading: const Icon(
                Icons.account_circle_rounded,
              ),
              title: CustomTextWidget(
                text: 'Profile',
                fSize: 18,
                textColor: Colors.white,
              ),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(
                Icons.settings,
              ),
              title: CustomTextWidget(
                text: 'Settings',
                fSize: 18,
                textColor: Colors.white,
              ),
            ),
            ListTile(
              onTap: () => Get.to(const NotificationScreen(),
                  transition: Transition.rightToLeft),
              leading: const Icon(
                Icons.notifications,
              ),
              title: CustomTextWidget(
                text: 'Notification',
                fSize: 18,
                textColor: Colors.white,
              ),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(
                Icons.security,
              ),
              title: CustomTextWidget(
                text: 'Security',
                fSize: 18,
                textColor: Colors.white,
              ),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(
                Icons.logout_rounded,
              ),
              title: CustomTextWidget(
                text: 'Logout',
                fSize: 18,
                textColor: Colors.white,
              ),
            ),
            const Spacer(),
            DefaultTextStyle(
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white54,
              ),
              child: Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 16.0,
                ),
                child: const Text('Terms of Service | Privacy Policy'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
