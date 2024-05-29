import 'package:dio/dio.dart';
import 'package:nike/data/data_common/http_response_validator.dart';
import 'package:nike/data/product.dart';

abstract class IproductDatasource {
  Future<List<ProductEntity>> getAll(int sort);
  Future<List<ProductEntity>> search(String searchTerm);
}


class ProductRemoteDataSource with HttpResponseValdiator implements IproductDatasource{
  final Dio httpclient;

  ProductRemoteDataSource(this.httpclient);
  @override
  Future<List<ProductEntity>> getAll(int sort) async {
    final response = await httpclient.get('product/list?sort=$sort');
    validateResponse(response);
    final products = <ProductEntity>[];
    (response.data as List).forEach((element) {
      products.add(ProductEntity.fromjson(element));
    });
    return products;
  }

  @override
  Future<List<ProductEntity>> search(String searchTerm) async{
    final response = await httpclient.get('product/search?q=$searchTerm');
    validateResponse(response);
    final products = <ProductEntity>[];
    (response.data as List).forEach((element) {
      products.add(ProductEntity.fromjson(element));
    });
    return products;
  }
  
 
  


}
