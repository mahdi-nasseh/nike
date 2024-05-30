import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nike/common/exception.dart';
import 'package:nike/data/banner.dart';
import 'package:nike/data/product.dart';
import 'package:nike/data/repository/banner_repository.dart';
import 'package:nike/data/source/product_data_source.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IBannerRepository bannerRepository;
  final IproductDatasource productRepository;
  HomeBloc({required this.bannerRepository, required this.productRepository})
      : super(HomeLoading()) {
    on<HomeEvent>((event, emit) async {
      if (event is HomeStarted || event is HomeRefresh) {
        try {
          emit(HomeLoading());
          final banners = await bannerRepositiry.getAll();
          final latestProducts =
              await productRepository.getAll(SortProduct.latest);
          final popularProducts =
              await productRepository.getAll(SortProduct.popular);

          emit(
            HomeSuccess(
                banners: banners,
                latestProducts: latestProducts,
                popularProducts: popularProducts),
          );
        } catch (e) {
          emit(HomeError(exception: e is AppException ? e : AppException()));
        }
      }
    });
  }
}
