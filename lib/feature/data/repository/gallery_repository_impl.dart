import 'package:test_flutter/core/network_info.dart';
import 'package:test_flutter/feature/data/data_source/remote_data_source.dart';
import 'package:test_flutter/feature/domain/entity/photo_entity.dart';
import 'package:test_flutter/feature/domain/repository/gallery_repository.dart';

class GalleryRepositoryImpl implements GalleryRepository {
  final GalleryRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  GalleryRepositoryImpl({required this.remoteDataSource, required this.networkInfo});

  ///Checks the Internet connection
  ///
  ///Returns 30 photos from page if isConnected
  ///
  ///Throws [ArgumentError] if connection lost
  @override
  Future<List<PhotoEntity>> getAllPhotos(int page) async {
    if (await networkInfo.isConnected) {
      final remoteGallery = await remoteDataSource.getAllPhotos(page);
      return remoteGallery;
    } else {
      isDisconnected();
    }
  }

  Never isDisconnected() {
    throw ArgumentError('Lost Internet connection');
  }
}
