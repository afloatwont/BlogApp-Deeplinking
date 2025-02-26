// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'blog_post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BlogPost _$BlogPostFromJson(Map<String, dynamic> json) {
  return _BlogPost.fromJson(json);
}

/// @nodoc
mixin _$BlogPost {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get summary => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get imageURL => throw _privateConstructorUsedError;
  String get deeplink => throw _privateConstructorUsedError;

  /// Serializes this BlogPost to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BlogPost
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BlogPostCopyWith<BlogPost> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlogPostCopyWith<$Res> {
  factory $BlogPostCopyWith(BlogPost value, $Res Function(BlogPost) then) =
      _$BlogPostCopyWithImpl<$Res, BlogPost>;
  @useResult
  $Res call(
      {String id,
      String title,
      String summary,
      String content,
      String imageURL,
      String deeplink});
}

/// @nodoc
class _$BlogPostCopyWithImpl<$Res, $Val extends BlogPost>
    implements $BlogPostCopyWith<$Res> {
  _$BlogPostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BlogPost
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? summary = null,
    Object? content = null,
    Object? imageURL = null,
    Object? deeplink = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      imageURL: null == imageURL
          ? _value.imageURL
          : imageURL // ignore: cast_nullable_to_non_nullable
              as String,
      deeplink: null == deeplink
          ? _value.deeplink
          : deeplink // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BlogPostImplCopyWith<$Res>
    implements $BlogPostCopyWith<$Res> {
  factory _$$BlogPostImplCopyWith(
          _$BlogPostImpl value, $Res Function(_$BlogPostImpl) then) =
      __$$BlogPostImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String summary,
      String content,
      String imageURL,
      String deeplink});
}

/// @nodoc
class __$$BlogPostImplCopyWithImpl<$Res>
    extends _$BlogPostCopyWithImpl<$Res, _$BlogPostImpl>
    implements _$$BlogPostImplCopyWith<$Res> {
  __$$BlogPostImplCopyWithImpl(
      _$BlogPostImpl _value, $Res Function(_$BlogPostImpl) _then)
      : super(_value, _then);

  /// Create a copy of BlogPost
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? summary = null,
    Object? content = null,
    Object? imageURL = null,
    Object? deeplink = null,
  }) {
    return _then(_$BlogPostImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      imageURL: null == imageURL
          ? _value.imageURL
          : imageURL // ignore: cast_nullable_to_non_nullable
              as String,
      deeplink: null == deeplink
          ? _value.deeplink
          : deeplink // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BlogPostImpl implements _BlogPost {
  const _$BlogPostImpl(
      {required this.id,
      required this.title,
      required this.summary,
      required this.content,
      required this.imageURL,
      required this.deeplink});

  factory _$BlogPostImpl.fromJson(Map<String, dynamic> json) =>
      _$$BlogPostImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String summary;
  @override
  final String content;
  @override
  final String imageURL;
  @override
  final String deeplink;

  @override
  String toString() {
    return 'BlogPost(id: $id, title: $title, summary: $summary, content: $content, imageURL: $imageURL, deeplink: $deeplink)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlogPostImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.imageURL, imageURL) ||
                other.imageURL == imageURL) &&
            (identical(other.deeplink, deeplink) ||
                other.deeplink == deeplink));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, summary, content, imageURL, deeplink);

  /// Create a copy of BlogPost
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BlogPostImplCopyWith<_$BlogPostImpl> get copyWith =>
      __$$BlogPostImplCopyWithImpl<_$BlogPostImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BlogPostImplToJson(
      this,
    );
  }
}

abstract class _BlogPost implements BlogPost {
  const factory _BlogPost(
      {required final String id,
      required final String title,
      required final String summary,
      required final String content,
      required final String imageURL,
      required final String deeplink}) = _$BlogPostImpl;

  factory _BlogPost.fromJson(Map<String, dynamic> json) =
      _$BlogPostImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get summary;
  @override
  String get content;
  @override
  String get imageURL;
  @override
  String get deeplink;

  /// Create a copy of BlogPost
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BlogPostImplCopyWith<_$BlogPostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
