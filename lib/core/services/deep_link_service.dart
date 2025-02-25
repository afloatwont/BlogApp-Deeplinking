import 'package:app_links/app_links.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';
import 'package:zarityassignment/core/utils/logger.dart';

final deepLinkServiceProvider = Provider<DeepLinkService>((ref) {
  return DeepLinkService();
});

class DeepLinkService {
  final AppLinks _appLinks = AppLinks();

  Future<void> initDeepLinks(GoRouter router) async {
    try {
      // Handle initial deep link if app was launched from terminated state
      final initialUri = await _appLinks.getInitialLink
      ();
      if (initialUri == null) {
        logger.d("No initial deep link found.");
      } else {
        logger.d("Initial deep link: $initialUri");
        _handleDeepLink(initialUri, router);
      }

      // Handle deep links when app is in background/foreground
      _appLinks.uriLinkStream.listen((uri) {
        logger.d('Deep link received: $uri');
        _handleDeepLink(uri, router);
      });
    } catch (e) {
      print('Deep link error: $e');
    }
  }

  void _handleDeepLink(Uri uri, GoRouter router) {
    try {
      if (uri.pathSegments.contains('blogs')) {
        final blogId = uri.pathSegments.last;
        // Use pushReplacement to avoid stacking routes
        router.pushReplacement('/blog/$blogId');
      }
    } catch (e) {
      print('Error handling deep link: $e');
    }
  }

  Future<void> shareBlogPost(String blogId, String title) async {
    final url = 'https://zarityassignment.vercel.app/blogs/$blogId';
    await Share.share(
      'Check out this blog post: $title\n$url',
      subject: title,
    );
  }
}
