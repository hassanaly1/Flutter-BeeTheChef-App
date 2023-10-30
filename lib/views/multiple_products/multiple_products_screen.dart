import 'package:beethechef/models/product_model.dart';
import 'package:beethechef/utilities/constants.dart';
import 'package:beethechef/views/cart_and_checkout/cart_screen.dart';
import 'package:beethechef/views/multiple_products/components/custom_product_container.dart';
import 'package:beethechef/widgets/custom_appbar.dart';
import 'package:beethechef/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MultipleProductScreen extends StatefulWidget {
  const MultipleProductScreen({super.key});

  @override
  State<MultipleProductScreen> createState() => _MultipleProductScreenState();
}

class _MultipleProductScreenState extends State<MultipleProductScreen> {
  YoutubePlayerController? _controller;

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController(
        initialVideoId: 'lNQJNImBsKY',
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: true,
          isLive: false,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _controller!,
          showVideoProgressIndicator: true,
          progressIndicatorColor: AppAssets.primaryColor,
          progressColors: const ProgressBarColors(
            playedColor: AppAssets.primaryColor,
            handleColor: AppAssets.textColor,
          ),
        ),
        builder: (context, player) {
          return Scaffold(
            appBar: CustomAppBarWidget(
              title: '',
              actions: [
                IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/search.svg",
                    colorFilter: const ColorFilter.mode(
                        AppAssets.textColor, BlendMode.srcIn),
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/cart.svg",
                    colorFilter: const ColorFilter.mode(
                        AppAssets.textColor, BlendMode.srcIn),
                  ),
                  onPressed: () {
                    Get.to(const CartScreen(), transition: Transition.upToDown);
                  },
                ),
                const SizedBox(width: defaultPadding / 2)
              ],
            ),
            body: Column(
              children: [
                player,
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        itemCount: products.length,
                        shrinkWrap: true,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return CustomProductContainer(
                            index: index,
                          );
                        },
                      )),
                ),
              ],
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(12.0),
              child: CustomButton(
                buttonText: 'Purchase All',
                onTap: () {},
              ),
            ),
          );
        });
  }
}
