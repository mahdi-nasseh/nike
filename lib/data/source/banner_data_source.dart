import 'package:dio/dio.dart';
import 'package:nike/data/banner.dart';
import 'package:nike/data/data_common/http_response_validator.dart';

abstract class IBannerDataSource {
  Future<List<BannerEntity>> getAll();
}

class BannerRemoteDataSource
    with HttpResponseValdiator
    implements IBannerDataSource {
  final Dio httpclient;

  BannerRemoteDataSource(this.httpclient);

  @override
  Future<List<BannerEntity>> getAll() async {
    final response = await httpclient.get('banner/slider');
    validateResponse(response);
    final List<BannerEntity> banners = [];
    (response.data as List).forEach((element) {
      banners.add(BannerEntity.fromjson(element));
    });
    return banners;
  }
}
