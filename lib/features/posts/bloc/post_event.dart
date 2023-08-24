part of 'post_bloc.dart';

@immutable
abstract class PostEvent {}

class PostFetchInitalEvent extends PostEvent {}

class PostAddEvent extends PostEvent{}