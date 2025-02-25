import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/blog_post.dart';
import 'logger.dart';

class FirestoreSeeder {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future<void> seedBlogPosts() async {
    try {
      logger.i('Starting to seed blog posts...');
      
      final dummyPosts = [
        BlogPost(
          id: '1',
          title: 'Getting Started with Flutter',
          summary: 'Learn the basics of Flutter development',
          content: 'Flutter is Google\'s UI toolkit for building beautiful, natively compiled applications for mobile, web, and desktop from a single codebase...',
          imageURL: 'https://picsum.photos/seed/flutter/800/400',
          deeplink: 'blog/1',
        ),
        BlogPost(
          id: '2',
          title: 'State Management with Riverpod',
          summary: 'Deep dive into Riverpod state management',
          content: 'Riverpod is a complete rewrite of the Provider package that removes its limitations while keeping its core concepts...',
          imageURL: 'https://picsum.photos/seed/riverpod/800/400',
          deeplink: 'blog/2',
        ),
        BlogPost(
          id: '3',
          title: 'Firebase Integration',
          summary: 'Learn how to integrate Firebase with Flutter',
          content: 'Firebase provides the tools and infrastructure you need to develop high-quality apps...',
          imageURL: 'https://picsum.photos/seed/firebase/800/400',
          deeplink: 'blog/3',
        ),
      ];

      // Add each post to Firestore
      for (var post in dummyPosts) {
        await _firestore.collection('blogPosts').doc(post.id).set(post.toJson());
        logger.i('Added blog post: ${post.title}');
      }

      logger.i('Successfully seeded ${dummyPosts.length} blog posts');
    } catch (e) {
      logger.e('Error seeding blog posts: $e');
      rethrow;
    }
  }
}