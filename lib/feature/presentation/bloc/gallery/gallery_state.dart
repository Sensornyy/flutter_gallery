import 'package:equatable/equatable.dart';

import 'package:test_flutter/feature/domain/entity/photo_entity.dart';

abstract class GalleryState extends Equatable {
  const GalleryState();

  @override
  List<Object> get props => [];
}

class GalleryInitialState extends GalleryState {
  @override
  List<Object> get props => [];
}

class GalleryLoadingState extends GalleryState {
  final List<PhotoEntity> oldGallery;
  final bool isFirstFetch;

  const GalleryLoadingState(this.oldGallery, {this.isFirstFetch = false});

  @override
  List<Object> get props => [oldGallery];
}

class GalleryLoadedState extends GalleryState {
  final List<PhotoEntity> loadedGallery;

  const GalleryLoadedState({required this.loadedGallery});

  @override
  List<Object> get props => [loadedGallery];
}
