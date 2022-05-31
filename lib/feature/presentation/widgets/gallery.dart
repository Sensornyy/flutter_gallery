import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:test_flutter/feature/domain/entity/photo_entity.dart';
import 'package:test_flutter/feature/presentation/bloc/gallery/gallery_cubit.dart';
import 'package:test_flutter/feature/presentation/bloc/gallery/gallery_state.dart';
import 'package:test_flutter/feature/presentation/widgets/photo_card.dart';

class Gallery extends StatelessWidget {
  Gallery({Key? key}) : super(key: key);

  final scrollController = ScrollController();

  void setupScrollController(BuildContext context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          context.read<GalleryCubit>().loadPhotos();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    setupScrollController(context);
    bool isLoading = false;

    return BlocBuilder<GalleryCubit, GalleryState>(
      builder: (context, state) {
        List<PhotoEntity> photos = [];

        if (state is GalleryLoadingState && state.isFirstFetch) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GalleryLoadingState) {
          photos = state.oldGallery;
          isLoading = true;
        } else if (state is GalleryLoadedState) {
          photos = state.loadedGallery;
        }

        return GridView.builder(
          controller: scrollController,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            crossAxisSpacing: 0,
            mainAxisSpacing: 50,
          ),
          itemCount: photos.length + (isLoading ? 2 : 0),
          itemBuilder: (context, index) {
            if (index < photos.length) {
              return PhotoCard(photos[index]);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        );
      },
    );
  }
}
