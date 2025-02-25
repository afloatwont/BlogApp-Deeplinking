// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BlogPostImpl _$$BlogPostImplFromJson(Map<String, dynamic> json) =>
    _$BlogPostImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      summary: json['summary'] as String,
      content: json['content'] as String,
      imageURL: json['imageURL'] as String,
      deeplink: json['deeplink'] as String,
    );

Map<String, dynamic> _$$BlogPostImplToJson(_$BlogPostImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'summary': instance.summary,
      'content': instance.content,
      'imageURL': instance.imageURL,
      'deeplink': instance.deeplink,
    };
