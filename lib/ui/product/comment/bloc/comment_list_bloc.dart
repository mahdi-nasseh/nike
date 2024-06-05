import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nike/common/exception.dart';
import 'package:nike/data/comment.dart';
import 'package:nike/data/repository/comment_reoisitory.dart';

part 'comment_list_event.dart';
part 'comment_list_state.dart';

class CommentListBloc extends Bloc<CommentListEvent, CommentListState> {
  final int productId;
  final ICommentRepository repository;

  CommentListBloc({required this.productId, required this.repository})
      : super(CommentListLoading()) {
    on<CommentListEvent>((event, emit) async {
      if (event is CommentListStarted) {
        emit(CommentListLoading());
        try {
          final comments = await repository.getAll(productId: productId);
          emit(CommentListSuccess(comments: comments));
        } catch (e) {
          emit(
            CommentLisError(
              exceptoin: AppException(),
            ),
          );
        }
      }
    });
  }
}
