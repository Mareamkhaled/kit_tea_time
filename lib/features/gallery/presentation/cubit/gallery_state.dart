part of 'gallery_cubit.dart';

sealed class GalleryState extends Equatable {
  const GalleryState();
}

final class GalleryLoading extends GalleryState {
  @override
  List<Object> get props => [];
}

final class GalleryLoaded extends GalleryState {
  final List<CatModel> galleries;
  final bool hasReachedEnd;
  final bool isLoadingMore;

  const GalleryLoaded({
    required this.galleries,
    this.hasReachedEnd = false,
    this.isLoadingMore = false,
  });

  @override
  List<Object> get props => [galleries, hasReachedEnd, isLoadingMore];
}

final class GalleryFailed extends GalleryState {
  final String errorMessage;

  const GalleryFailed(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}