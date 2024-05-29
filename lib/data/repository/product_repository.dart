import 'package:nike/common/http_client.dart';
import 'package:nike/data/product.dart';
import 'package:nike/data/source/product_data_source.dart';

final productRepository =
    ProductRepository(ProductRemoteDataSource(httpClient));

abstract class IProductRepository {
  Future<List<ProductEntity>> getAll(int sort);
  Future<List<ProductEntity>> search(String searchTerm);
}

class ProductRepository implements IproductDatasource {
  final IproductDatasource datasource;

  ProductRepository(this.datasource);

  @override
  Future<List<ProductEntity>> getAll(int sort) => datasource.getAll(sort);

  @override
  Future<List<ProductEntity>> search(String searchTerm) =>
      datasource.search(searchTerm);
}
