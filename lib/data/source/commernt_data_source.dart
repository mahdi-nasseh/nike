import 'package:dio/dio.dart';
import 'package:nike/data/comment.dart';
import 'package:nike/data/data_common/http_response_validator.dart';

abstract class ICommentDataSource {
  Future<List<CommentEntity>> getAll({required int productId});
}

class CommentDataSource
    with HttpResponseValdiator
    implements ICommentDataSource {
  final Dio httpclient;

  CommentDataSource({required this.httpclient});
  @override
  Future<List<CommentEntity>> getAll({required int productId}) async {
    final response = await httpclient.get('comment/list?product_id=$productId');
    validateResponse(response);
    final List<CommentEntity> comments = [];
    (response.data as List).forEach((element) {
      comments.add(CommentEntity.fromjson(element));
    });
    return comments;
  }
}
