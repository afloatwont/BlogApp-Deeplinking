import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:zarityassignment/core/services/deep_link_service.dart';
import 'package:zarityassignment/views/screens/blog/blog_detail_screen.dart';
import 'package:zarityassignment/views/screens/blog/blog_list_screen.dart';

final deepLinkProvider = StateProvider<String?>((ref) => null);

final router = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const BlogListScreen(),
    ),
    GoRoute(
      path: '/blog/:id',
      name: 'blog_detail',
      builder: (context, state) => BlogDetailScreen(
        blogPostId: state.pathParameters['id'] ?? '',
      ),
    ),
  ],
  redirect: (context, state) {
    // Handle any redirect logic here
    return null;
  },
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final container = ProviderContainer();
  final deepLinkService = container.read(deepLinkServiceProvider);
  await deepLinkService.initDeepLinks(router);

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Zarity Assignment',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
