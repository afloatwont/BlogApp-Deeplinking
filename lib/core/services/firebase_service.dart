import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/blog_post.dart';
import '../utils/logger.dart';
import '../utils/error_handler.dart';

final firebaseServiceProvider = Provider<FirebaseService>((ref) {
  return FirebaseService();
});

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<BlogPost>> fetchBlogPosts() async {
    try {
      logger.i('Fetching blog posts');
      final snapshot = await _firestore.collection('blogPosts').get();

      if (snapshot.docs.isEmpty) {
        logger.w('No blog posts found');
        return [];
      }

      return snapshot.docs.map((doc) {
        try {
          final data = doc.data();
          return BlogPost.fromJson({
            'id': doc.id,
            ...data,
          });
        } catch (e) {
          logger.e('Error parsing blog post ${doc.id}: $e');
          throw AppError('Error parsing blog post data',
              code: 'parse-error', originalError: e);
        }
      }).toList();
    } catch (e) {
      logger.e('Error fetching blog posts: $e');
      throw AppError('Failed to fetch blog posts',
          code: 'fetch-error', originalError: e);
    }
  }

  Future<BlogPost> fetchBlogPost(String id) async {
    try {
      final doc = await _firestore.collection('blogPosts').doc(id).get();
      if (!doc.exists) {
        throw Exception('Blog post not found');
      }
      return BlogPost.fromJson({
        'id': doc.id,
        ...doc.data()!,
      });
    } catch (e) {
      throw Exception('Failed to fetch blog post: $e');
    }
  }

  Future<void> addBlogPost(BlogPost post) async {
    try {
      await _firestore.collection('blogPosts').add(post.toJson());
    } catch (e) {
      throw Exception('Failed to add blog post: $e');
    }
  }

  Future<void> updateBlogPost(
      String postId, Map<String, dynamic> blogPostData) async {
    try {
      await _firestore.collection('blogPosts').doc(postId).update(blogPostData);
    } catch (e) {
      throw Exception('Failed to update blog post: $e');
    }
  }

  Future<void> deleteBlogPost(String postId) async {
    try {
      await _firestore.collection('blogPosts').doc(postId).delete();
    } catch (e) {
      throw Exception('Failed to delete blog post: $e');
    }
  }
}
