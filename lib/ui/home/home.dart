import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike/data/repository/banner_repository.dart';
import 'package:nike/data/repository/product_repository.dart';
import 'package:nike/ui/home/bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    itemCount: 5,
                    padding: const EdgeInsets.fromLTRB(12, 12, 12, 100),
                    itemBuilder: (context, index) {
                      switch (index) {
                        case 0:
                          return Image.asset(
                            'assets/img/nike_logo.png',
                            height: 32,
                          );
                        case 2:
                          return SizedBox(
                            height: 250,
                            child: PageView.builder(
                              itemCount: state.banners.length,
                              itemBuilder: (context, index) => CachedNetworkImage(
                                imageUrl: state.banners.toString(),
                              ),
                            ),
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
