import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike/data/comment.dart';
import 'package:nike/data/repository/comment_reoisitory.dart';
import 'package:nike/ui/product/comment/bloc/comment_list_bloc.dart';
import 'package:nike/ui/widget/error.dart';

class CommentList extends StatelessWidget {
  final int productId;
  const CommentList({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final CommentListBloc bloc = CommentListBloc(
            repository: commentRepository, productId: productId);
        bloc.add(CommentListStarted());
        return bloc;
      },
      child: BlocBuilder<CommentListBloc, CommentListState>(
        builder: (context, state) {
          if (state is CommentListSuccess) {
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final comment = state.comments[index];
                  return CommentItem(
                    comment: comment,
                  );
                },
                childCount: state.comments.length,
              ),
            );
          } else if (state is CommentListLoading) {
            return const SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()),
            );
          } else if (state is CommentLisError) {
            return SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 26),
                child: AppErrorException(
                  exception: state.exceptoin,
                  onPressed: () => BlocProvider.of<CommentListBloc>(context)
                      .add(CommentListStarted()),
                ),
              ),
            );
          } else {
            throw Exception('state is not valid');
          }
        },
      ),
    );
  }
}

class CommentItem extends StatelessWidget {
  final CommentEntity comment;
  const CommentItem({
    super.key,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade300,
        ),
        borderRadius: BorderRadius.circular(4)
      ),
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.fromLTRB(8, 0, 8, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                comment.title,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              Text(
                comment.date,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            comment.email,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            comment.content,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
