part of 'comment_list_bloc.dart';

sealed class CommentListState extends Equatable {
  const CommentListState();
  
  @override
  List<Object> get props => [];
}

final class CommentListLoading extends CommentListState {}

class CommentListSuccess extends CommentListState{
  final List<CommentEntity> comments;

  const CommentListSuccess({required this.comments});

  @override
  List<Object> get props => [comments];
}

class CommentLisError extends CommentListState{
  final AppException exceptoin;

  const CommentLisError({required this.exceptoin});

  @override
  List<Object> get props => [exceptoin];
}
