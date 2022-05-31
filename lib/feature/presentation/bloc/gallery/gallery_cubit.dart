import 'package:flutter_bloc/flutter_bloc.dart';

import 'gallery_state.dart';
import 'package:test_flutter/feature/domain/entity/photo_entity.dart';
import 'package:test_flutter/feature/domain/use_case/get_photos.dart';

class GalleryCubit extends Cubit<GalleryState> {
  final GetPhotos getPhotos;

  GalleryCubit({required this.getPhotos}) : super(GalleryInitialState());

  int page = 1;

  ///The function is called every time user needs to load new 30 photos from next page
  ///
  ///Previous photos stay in the list [newGallery], new photos from the page are added to the list
  void loadPhotos() async {
    if (state is GalleryLoadingState) return;

    final currentState = state;
    var oldGallery = <PhotoEntity>[];

    if (currentState is GalleryLoadedState) {
      oldGallery = currentState.loadedGallery;
    }
    emit(GalleryLoadingState(oldGallery, isFirstFetch: page == 1));
    final gallery = await getPhotos(page);

    for (var photo in gallery) {
      page++;
      final newGallery = oldGallery;
      newGallery.add(photo);
      emit(GalleryLoadedState(loadedGallery: newGallery));
    }
  }
}
