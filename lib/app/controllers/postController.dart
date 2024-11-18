// controllers/post_controller.dart


import 'package:get/get.dart';
import 'package:latihanpas/app/data/apiService.dart';
import 'package:latihanpas/app/models/premModel.dart';

class PostController extends GetxController {
  var isLoading = true.obs;
  var postList = <Team>[].obs;

  @override
  void onInit() {
    fetchPosts();
    super.onInit();
  }

  void fetchPosts() async {
    try {
      isLoading(true);
      var posts = await ApiService().fetchPosts();
      postList.assignAll(posts);
    } finally {
      isLoading(false);
    }
  }
}