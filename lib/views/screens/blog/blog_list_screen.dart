import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../viewmodels/blog_list_viewmodel.dart';
import '../../widgets/blog_card.dart';
import '../../widgets/glass_container.dart';

class BlogListScreen extends ConsumerWidget {
  const BlogListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final blogPostsState = ref.watch(blogListProvider);
    final colorScheme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: colorScheme.background.withOpacity(0.7),
        title: GlassContainer(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.04,
            vertical: size.height * 0.01,
          ),
          child: Text(
            'Blog Posts',
            style: TextStyle(color: colorScheme.onBackground),
          ),
        ),
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              colorScheme.primary.withOpacity(0.05),
              colorScheme.surface,
              colorScheme.secondary.withOpacity(0.05),
            ],
          ),
        ),
        child: blogPostsState.when(
          loading: () => const _LoadingView(),
          error: (error, stackTrace) => _ErrorView(
            error: error,
            onRetry: () => ref.refresh(blogListProvider),
          ),
          data: (blogPosts) => blogPosts.isEmpty
              ? Center(
                  child: GlassContainer(
                    padding: EdgeInsets.all(size.width * 0.05),
                    child: Text(
                      'No blog posts found',
                      style: TextStyle(color: colorScheme.secondary),
                    ),
                  ),
                )
              : ListView.builder(
                  padding: EdgeInsets.only(
                    top: padding.top + kToolbarHeight + size.height * 0.02,
                    bottom: size.height * 0.02,
                    left: size.width * 0.04,
                    right: size.width * 0.04,
                  ),
                  itemCount: blogPosts.length,
                  itemBuilder: (context, index) {
                    final blogPost = blogPosts[index];
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: size.height * 0.01),
                      child: GlassContainer(
                        child: BlogCard(
                          blogPost: blogPost,
                          onTap: () => context.go('/blog/${blogPost.id}'),
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}

class _LoadingView extends StatelessWidget {
  const _LoadingView();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: colorScheme.primary,
            strokeWidth: 3,
          ),
          const SizedBox(height: 16),
          Text(
            'Loading...',
            style: TextStyle(
              color: colorScheme.primary,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  final Object error;
  final VoidCallback onRetry;

  const _ErrorView({required this.error, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;

    return Center(
      child: GlassContainer(
        padding: EdgeInsets.all(size.width * 0.06),
        margin: EdgeInsets.all(size.width * 0.04),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.error_outline,
              color: colorScheme.error,
              size: size.width * 0.12,
            ),
            SizedBox(height: size.height * 0.02),
            Text(
              'Error: ${error.toString()}',
              style: TextStyle(
                color: colorScheme.error,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: size.height * 0.03),
            FilledButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh),
              label: const Text('Retry'),
              style: FilledButton.styleFrom(
                backgroundColor: colorScheme.error,
                foregroundColor: colorScheme.onError,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
