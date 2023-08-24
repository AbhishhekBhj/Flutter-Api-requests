import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:blocapirequests/features/posts/models/post_model.dart';
import 'package:blocapirequests/features/posts/repositories/post_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<PostFetchInitalEvent>(postFetchInitialEvent);
    on<PostAddEvent>(postAddEvent);
  }

  Future<void> postFetchInitialEvent(
      PostFetchInitalEvent event, Emitter<PostState> emit) async {
    emit(PostFetchingLoadingState());
    List<PostModel> postModel = await PostRepository.fetchPostModel();
    emit(PostSuccessfulFetchingState(posts: postModel));
  }

  FutureOr<void> postAddEvent(
      PostAddEvent event, Emitter<PostState> emit) async {
    bool success = await PostRepository.addPost();
    print(success);
    if (success) {
      emit(PostSuccessState());
    } else {
      emit(PostFailureState());
    }
  }
}
