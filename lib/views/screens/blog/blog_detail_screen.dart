import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:zarityassignment/core/services/deep_link_service.dart';
import '../../../viewmodels/blog_detail_viewmodel.dart';
import '../../../views/widgets/glass_container.dart';

class BlogDetailScreen extends ConsumerWidget {
  final String blogPostId;

  const BlogDetailScreen({super.key, required this.blogPostId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final blogPostState = ref.watch(blogDetailProvider(blogPostId));
    final colorScheme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;

    return WillPopScope(
      onWillPop: () async {
        context.go('/');
        return false;
      },
      child: Scaffold(
        backgroundColor: colorScheme.surface,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: colorScheme.surface.withOpacity(0.7),
          title: GlassContainer(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.04,
              vertical: size.height * 0.01,
            ),
            child: Text(
              'Blog Detail',
              style: TextStyle(color: colorScheme.onBackground),
            ),
          ),
          elevation: 0,
          leading: GlassContainer(
            child: BackButton(
              onPressed: () => context.go('/'),
              color: colorScheme.onBackground,
            ),
          ),
          actions: [
            GlassContainer(
              margin: EdgeInsets.only(right: size.width * 0.02),
              child: IconButton(
                icon: Icon(Icons.share, color: colorScheme.onBackground),
                onPressed: () => blogPostState.whenData((blogPost) {
                  ref.read(deepLinkServiceProvider).shareBlogPost(
                        blogPost.id,
                        blogPost.title,
                      );
                }),
              ),
            ),
          ],
        ),
        body: Container(
          height: double.infinity,
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
          child: blogPostState.when(
            loading: () => const _LoadingView(),
            error: (error, stackTrace) => _ErrorView(
              error: error,
              onRetry: () => ref.refresh(blogDetailProvider(blogPostId)),
            ),
            data: (blogPost) => SingleChildScrollView(
              padding: EdgeInsets.only(top: padding.top),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (blogPost.imageURL.isNotEmpty)
                    Hero(
                      tag: 'blog-image-${blogPost.id}',
                      child: Container(
                        height: size.height * 0.35,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(blogPost.imageURL),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                colorScheme.surface.withOpacity(0.8),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.04,
                      vertical: size.height * 0.02,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GlassContainer(
                          padding: EdgeInsets.all(size.width * 0.05),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                blogPost.title,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(
                                      color: colorScheme.primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              SizedBox(height: size.height * 0.02),
                              Text(
                                blogPost.summary,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      color: colorScheme.secondary,
                                      height: 1.5,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: size.height * 0.03),
                        GlassContainer(
                          padding: EdgeInsets.all(size.width * 0.05),
                          child: Text(
                            blogPost.content,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  height: 1.8,
                                  color: colorScheme.onSurface,
                                ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.04),
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
