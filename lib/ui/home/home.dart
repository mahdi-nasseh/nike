import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike/common/utils.dart';
import 'package:nike/data/product.dart';
import 'package:nike/data/repository/banner_repository.dart';
import 'package:nike/data/repository/product_repository.dart';
import 'package:nike/ui/home/bloc/home_bloc.dart';
import 'package:nike/ui/product/product.dart';
import 'package:nike/ui/widget/banner_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return BlocProvider(
      create: (context) {
        final homeBloc = HomeBloc(
            bannerRepository: bannerRepositiry,
            productRepository: productRepository);
        homeBloc.add(HomeStarted());
        return homeBloc;
      },
      child: SafeArea(
        child: Scaffold(
          body: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeSuccess) {
                return ListView.builder(
                    physics: defualtScrollPhysics,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      switch (index) {
                        case 0:
                          return Container(
                            height: 56,
                            alignment: Alignment.center,
                            child: Image.asset(
                              'assets/img/nike_logo.png',
                              fit: BoxFit.fitHeight,
                              height: 32,
                            ),
                          );
                        case 2:
                          return BannerSlider(state: state);
                        case 3:
                          return HorizantalList(
                            title: "جدیدترین",
                            products: state.latestProducts,
                            onTap: () {},
                            themeData: themeData,
                          );
                        case 4:
                          return HorizantalList(
                            title: "پربازدیدترین",
                            products: state.popularProducts,
                            onTap: () {},
                            themeData: themeData,
                          );
                        default:
                          return Container();
                      }
                    });
              } else if (state is HomeLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is HomeError) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(state.exception.message),
                      ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<HomeBloc>(context).add(HomeRefresh());
                        },
                        child: const Text('تلاش دوباره'),
                      ),
                    ],
                  ),
                );
              } else {
                throw Exception('state is not supported');
              }
            },
          ),
        ),
      ),
    );
  }
}

class HorizantalList extends StatelessWidget {
  final String title;
  final List<ProductEntity> products;
  final GestureTapCallback onTap;
  final ThemeData themeData;

  const HorizantalList({
    super.key,
    required this.title,
    required this.products,
    required this.onTap,
    required this.themeData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: themeData.textTheme.labelLarge,
              ),
              TextButton(onPressed: onTap, child: const Text('مشاهده همه'))
            ],
          ),
        ),
        SizedBox(
          height: 290,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: defualtScrollPhysics,
            itemCount: products.length,
            padding: const EdgeInsets.only(right: 8, left: 12, bottom: 8),
            itemBuilder: (context, index) {
              final product = products[index];
              return Padding(
                  padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                  child: ProductSlid(
                    product: product,
                    themeData: themeData,
                    borderRadius: BorderRadius.circular(12),
                  ));
            },
          ),
        )
      ],
    );
  }
}
