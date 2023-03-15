part of 'post_bloc.dart';

@immutable
abstract class PostState {}

class PostInitial extends PostState {}

class PostLoadingState extends PostState {}

class PostSuccessState extends PostState {
  // if success its mean that we have data for ui of state
  Future<List<PostModel>>? postData;
  PostSuccessState({this.postData});
}

class PostErrorState extends PostState {}
