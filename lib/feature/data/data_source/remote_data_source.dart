import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:test_flutter/feature/data/model/photo_model.dart';

abstract class GalleryRemoteDataSource {
  Future<List<PhotoModel>> getAllPhotos(int page);
}

///endpoint - https://api.unsplash.com/photos/?per_page=30&client_id=ab3411e4ac868c2646c0ed488dfd919ef612b04c264f3374c97fff98ed253dc9

class GalleryRemoteDataSourceImpl implements GalleryRemoteDataSource {
  final http.Client client;

  GalleryRemoteDataSourceImpl({required this.client});

  @override
  Future<List<PhotoModel>> getAllPhotos(int page) async {
    final response = await client.get(
        Uri.parse(
            'https://api.unsplash.com/photos/?page=$page&per_page=30&client_id=ab3411e4ac868c2646c0ed488dfd919ef612b04c264f3374c97fff98ed253dc9'),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final photos = json.decode(response.body);
      return (photos as List).map((user) => PhotoModel.fromJson(user)).toList();
    } else {
      isInvalid();
    }
  }

  Never isInvalid() {
    throw ArgumentError('The access token is invalid');
  }
}
