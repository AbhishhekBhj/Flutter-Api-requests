// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'post_bloc.dart';

@immutable
abstract class PostState {}

abstract class PostActionState extends PostState{}
final class PostInitial extends PostState {}

class PostSuccessfulFetchingState extends PostState {
  final List<PostModel> posts;
  PostSuccessfulFetchingState({
    required this.posts,
  });
}

class PostFetchingLoadingState extends PostState{}

class PostFetchingErrorState extends PostState{}

class PostSuccessState extends PostActionState{}

class PostFailureState extends PostActionState{}