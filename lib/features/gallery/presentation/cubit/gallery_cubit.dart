import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/cat_model.dart';
import '../../data/repo/gallery_repo.dart';

part 'gallery_state.dart';

class GalleryCubit extends Cubit<GalleryState> {
  GalleryCubit({required this.galleryRepo}) : super(GalleryLoading());

  final GalleryRepo galleryRepo;
  int page = 1;
  bool hasReachedEnd = false;

  Future<void> fetchGalleryImages({bool isLoadMore = false}) async {
    if (hasReachedEnd && isLoadMore) {
      return;
    }

    if (!isLoadMore) {
      page = 1;
      hasReachedEnd = false;
      emit(GalleryLoading());
    } else {
      final currentState = state;
      if (currentState is GalleryLoaded && currentState.isLoadingMore) {
        return;
      }
      if (currentState is GalleryLoaded) {
        emit(
          GalleryLoaded(
            galleries: currentState.galleries,
            isLoadingMore: true,
            hasReachedEnd: false,
          ),
        );
      }
    }

    final result = await galleryRepo.getGalleryImages(page: page);
    result.when(
      onSuccess: (newGalleries) {
        if (newGalleries.isEmpty) {
          hasReachedEnd = true;
        }

        final currentState = state;
        if (isLoadMore && currentState is GalleryLoaded) {
          emit(
            GalleryLoaded(
              galleries: [...currentState.galleries, ...newGalleries],
              hasReachedEnd: newGalleries.isEmpty,
              isLoadingMore: false,
            ),
          );
        } else {
          emit(
            GalleryLoaded(
              galleries: newGalleries,
              hasReachedEnd: newGalleries.isEmpty,
              isLoadingMore: false,
            ),
          );
        }

        if (newGalleries.isNotEmpty) {
          page++;
        }
      },
      onError: (error) {
        final currentState = state;
        if (isLoadMore && currentState is GalleryLoaded) {
          emit(
            GalleryLoaded(
              galleries: currentState.galleries,
              hasReachedEnd: false,
              isLoadingMore: false,
            ),
          );
        } else {
          emit(GalleryFailed(error.toString()));
        }
      },
    );
  }
}
