import 'package:zii_23_bloc_with_api/models/post_model.dart';

abstract class PostRepoSitory {
  Future<List<PostModel>> getAllPost();
}
