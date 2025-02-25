import 'package:freezed_annotation/freezed_annotation.dart';

part 'blog_post.freezed.dart';
part 'blog_post.g.dart';

@freezed
class BlogPost with _$BlogPost {
  const factory BlogPost({
    required String id,
    required String title,
    required String summary,
    required String content,
    required String imageURL,
    required String deeplink,
  }) = _BlogPost;

  factory BlogPost.fromJson(Map<String, dynamic> json) =>
      _$BlogPostFromJson(json);
}
