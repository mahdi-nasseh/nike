import 'package:nike/common/http_client.dart';
import 'package:nike/data/comment.dart';
import 'package:nike/data/source/commernt_data_source.dart';


final commentRepository = CommentRepository(dataSource: CommentDataSource(httpclient: httpClient));

abstract class ICommentRepository {
  Future<List<CommentEntity>> getAll({required int productId});
}

class CommentRepository implements ICommentRepository {
  final ICommentDataSource dataSource;

  CommentRepository({required this.dataSource});
  @override
  Future<List<CommentEntity>> getAll({required int productId}) =>
      dataSource.getAll(productId: productId);
}
