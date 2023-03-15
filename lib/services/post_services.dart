import 'dart:convert';

import 'package:zii_23_bloc_with_api/models/post_model.dart';
import 'package:zii_23_bloc_with_api/repository/post_repository.dart';
import 'package:http/http.dart' as http;

class PostService implements PostRepoSitory {
  @override
  Future<List<PostModel>> getAllPost() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    http.Response respone = await http.get(url);
    List listPost = json.decode(respone.body);
    List<PostModel> post =
        listPost.map((post) => PostModel.fromJson(post)).toList();
    return post;
  }
}
