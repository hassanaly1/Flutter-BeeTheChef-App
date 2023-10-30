import 'package:beethechef/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

SafeArea myDrawer() => SafeArea(
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
                'assets/images/banner1.jpg',
              ),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(
                Icons.home,
              ),
              title: CustomTextWidget(
                text: 'Home',
                fSize: 18,
                textColor: Colors.white,
              ),
            ),
            ListTile(
              onTap: () {},
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
                Icons.favorite,
              ),
              title: CustomTextWidget(
                text: 'Favourites',
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
