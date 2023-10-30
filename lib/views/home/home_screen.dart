import 'package:beethechef/models/categories_model.dart';
import 'package:beethechef/utilities/constants.dart';
import 'package:beethechef/views/cart_and_checkout/cart_screen.dart';
import 'package:beethechef/views/category/catogories_detail_screen.dart';
import 'package:beethechef/views/home/components/custom_section.dart';
import 'package:beethechef/views/home/components/drawer.dart';
import 'package:beethechef/views/home/components/single_category_widget.dart';
import 'package:beethechef/widgets/custom_text_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _advancedDrawerController = AdvancedDrawerController();
  final zoomDrawerController = ZoomDrawerController();
  final items = [
    Image.asset('assets/images/banner1.jpg'),
    Image.asset('assets/images/banner2.jpg'),
    Image.asset('assets/images/banner3.jpg'),
    Image.asset('assets/images/banner4.jpg'),
  ];
  final categories = [
    CategoryModel(name: 'Storage and Homes', image: 'assets/images/bag_2.png'),
    CategoryModel(
        name: 'Lightings and Electrical', image: 'assets/images/bag_3.png'),
    CategoryModel(
        name: 'Machines and Generators', image: 'assets/images/bag_4.png'),
    CategoryModel(name: 'Saftey Equipments', image: 'assets/images/bag_2.png'),
    CategoryModel(
        name: 'Cleaning Equipments', image: 'assets/images/bag_3.png'),
    CategoryModel(name: 'Tools', image: 'assets/images/bag_4.png'),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color.fromARGB(255, 43, 50, 54),
              AppAssets.primaryColor.withOpacity(0.9),
            ],
          ),
        ),
      ),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      // openScale: 1.0,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      drawer: const MyDrawer(),

      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppAssets.primaryColor,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Image.asset('assets/images/applogo.png'),
          ),
          leading: IconButton(
            onPressed: _handleMenuButtonPressed,
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: _advancedDrawerController,
              builder: (_, value, __) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  child: Icon(
                    value.visible ? Icons.clear : Icons.menu,
                    color: Colors.black,
                    key: ValueKey<bool>(value.visible),
                  ),
                );
              },
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/icons/heart.svg',
                  colorFilter:
                      const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                  height: 20,
                )),
            IconButton(
                onPressed: () {
                  Get.to(const CartScreen());
                },
                icon: SvgPicture.asset(
                  'assets/icons/cart.svg',
                  colorFilter:
                      const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                ))
          ],
        ),
        body: body(),
      ),
    );
  }

  CustomScrollView body() {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          snap: false,
          pinned: true,
          floating: false,
          flexibleSpace: FlexibleSpaceBar(
            background: Padding(
              padding: const EdgeInsets.all(12.0),
              child: CustomTextWidget(
                text: 'Location: Karachi, Pakistan',
                fSize: 18,
                fWeight: FontWeight.w400,
              ),
            ), //Images.network
          ),
          expandedHeight: 120,
          backgroundColor: AppAssets.primaryColor,
          // leading: IconButton(
          //   icon: const Icon(Icons.menu),
          //   onPressed: _openDrawer,
          // ),
          elevation: 0,

          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(30),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    height: 50, // Match the preferredSize
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Center(
                      child: TextFormField(
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: "Search",
                          hintStyle: const TextStyle(color: Colors.black),
                          prefixIcon: IconButton(
                            icon: SvgPicture.asset(
                              "assets/icons/search.svg",
                              colorFilter: const ColorFilter.mode(
                                  AppAssets.textColor, BlendMode.srcIn),
                            ),
                            onPressed: () {},
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                          autoPlayInterval: const Duration(seconds: 2),
                          autoPlay: true,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.25,
                          height: Get.height * 0.3,
                          onPageChanged: (index, reason) {
                            setState(() {
                              currentIndex = index;
                            });
                          },
                        ),
                        items: items,
                      ),
                      Center(
                        child: DotsIndicator(
                          dotsCount: items.length,
                          position: currentIndex,
                          decorator: const DotsDecorator(
                            activeColor: AppAssets.primaryColor,
                          ),
                        ),
                      ),
                      const Divider(thickness: 2),
                      CustomTextWidget(
                          text: 'Categories',
                          fSize: 20,
                          fWeight: FontWeight.w700),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: Get.height * 0.32,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            return SingleCategoryWidget(
                              categories: categories,
                              index: index,
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Divider(thickness: 2),
                      CustomSection(
                        heading: 'Top Rated Products',
                        onTap: () {
                          Get.to(
                              CategoryDetailScreen(
                                categoryName: categories[index].name,
                              ),
                              transition: Transition.rightToLeft);
                        },
                      ),
                      const Divider(thickness: 2),
                      CustomSection(
                        heading: 'Storage and Homes',
                        onTap: () {
                          Get.to(
                              CategoryDetailScreen(
                                categoryName: categories[index].name,
                              ),
                              transition: Transition.rightToLeft);
                        },
                      ),
                      const Divider(thickness: 2),
                      CustomSection(
                        heading: 'Lightings and Electrical',
                        onTap: () {
                          Get.to(
                              CategoryDetailScreen(
                                categoryName: categories[index].name,
                              ),
                              transition: Transition.rightToLeft);
                        },
                      ),
                      const Divider(thickness: 2),
                      CustomSection(
                        heading: 'Machines and Generators',
                        onTap: () {
                          Get.to(
                              CategoryDetailScreen(
                                categoryName: categories[index].name,
                              ),
                              transition: Transition.rightToLeft);
                        },
                      ),
                      const Divider(thickness: 2),
                      CustomSection(
                        heading: 'Saftey Equipments',
                        onTap: () {
                          Get.to(
                              CategoryDetailScreen(
                                categoryName: categories[index].name,
                              ),
                              transition: Transition.rightToLeft);
                        },
                      ),
                      const Divider(thickness: 2),
                      CustomSection(
                        heading: 'Cleaning Equipments',
                        onTap: () {
                          Get.to(
                              CategoryDetailScreen(
                                categoryName: categories[index].name,
                              ),
                              transition: Transition.rightToLeft);
                        },
                      ),
                      const Divider(thickness: 2),
                      CustomSection(
                        heading: 'Tools',
                        onTap: () {
                          Get.to(
                              CategoryDetailScreen(
                                categoryName: categories[index].name,
                              ),
                              transition: Transition.rightToLeft);
                        },
                      ),
                      const Divider(thickness: 2),
                    ],
                  ),
                ),
              );
            },
            childCount: 1,
          ),
        )
      ],
    );
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}
