// ignore_for_file: void_checks

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:zii_23_bloc_with_api/models/post_model.dart';
import 'package:zii_23_bloc_with_api/repository/post_repository.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepoSitory postRepoSitory;

  PostBloc({required this.postRepoSitory}) : super(PostInitial()) {
    on<PostEvent>((event, emit) {});

    Future<List<PostModel>> listPost = postRepoSitory.getAllPost();
    on<GetPostEvent>((event, emit) {
      return PostLoadingState();
      // ignore: dead_code
      try {
        return PostSuccessState(postData: listPost);
      } catch (e) {
        debugPrint('$e');
        return PostErrorState();
      }
    });
  }
}
