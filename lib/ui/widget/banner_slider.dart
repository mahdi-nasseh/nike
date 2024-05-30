import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nike/ui/home/bloc/home_bloc.dart';
import 'package:nike/ui/widget/image.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerSlider extends StatelessWidget {
  final HomeSuccess state;

  const BannerSlider({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 2,
          child: PageView.builder(
            physics: const BouncingScrollPhysics(),
            controller: controller,
            itemCount: state.banners.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: CachImage(
                  imageUrl: state.banners[index].imageUrl,
                  borderRadius: BorderRadius.circular(12),
                ),
              );
            },
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 8,
          child: Center(
            child: SmoothPageIndicator(
              controller: controller, 
              count: state.banners.length,
              textDirection: TextDirection.rtl,
              effect:  WormEffect(
                activeDotColor: Theme.of(context).colorScheme.secondary,
                dotColor: Colors.grey.shade400,
                dotHeight: 3,
                dotWidth: 20,
                spacing: 4,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
