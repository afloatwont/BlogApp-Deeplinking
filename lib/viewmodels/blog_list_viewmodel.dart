import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/blog_post.dart';
import '../core/services/firebase_service.dart';

final blogListProvider =
    StateNotifierProvider<BlogListNotifier, AsyncValue<List<BlogPost>>>((ref) {
  final firebaseService = ref.watch(firebaseServiceProvider);
  return BlogListNotifier(firebaseService);
});

class BlogListNotifier extends StateNotifier<AsyncValue<List<BlogPost>>> {
  final FirebaseService _firebaseService;

  BlogListNotifier(this._firebaseService) : super(const AsyncValue.loading()) {
    fetchBlogPosts();
  }

  Future<void> fetchBlogPosts() async {
    try {
      state = const AsyncValue.loading();
      final posts = await _firebaseService.fetchBlogPosts();
      state = AsyncValue.data(posts);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> addBlogPost(BlogPost post) async {
    try {
      await _firebaseService.addBlogPost(post);
      await fetchBlogPosts(); // Refresh the list after adding
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}
