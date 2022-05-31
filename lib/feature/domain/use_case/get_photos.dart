import 'package:test_flutter/feature/domain/entity/photo_entity.dart';
import 'package:test_flutter/feature/domain/repository/gallery_repository.dart';

class GetPhotos {
  final GalleryRepository galleryRepository;

  GetPhotos(this.galleryRepository);

  Future<List<PhotoEntity>> call(int page) async {
    return await galleryRepository.getAllPhotos(page);
  }
}

