import 'package:test_flutter/feature/domain/entity/photo_entity.dart';

abstract class GalleryRepository {
  Future<List<PhotoEntity>> getAllPhotos(int page);
}