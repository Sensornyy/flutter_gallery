import 'package:test_flutter/feature/domain/entity/photo_entity.dart';

///[preview] - small photo in Gallery
///
///[full] - same photo on full screen
class PhotoModel extends PhotoEntity {
  const PhotoModel({
    required String id,
    required String author,
    required String preview,
    required String full,
  }) : super(
          id: id,
          author: author,
          preview: preview,
          full: full,
        );

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      id: json['id'],
      author: json['user']['name'],
      preview: json['urls']['thumb'],
      full: json['urls']['regular'],
    );
  }
}
