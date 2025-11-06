import 'package:get_it/get_it.dart';

import '../../features/gallery/data/repo/gallery_repo.dart';
import '../../features/gallery/presentation/cubit/gallery_cubit.dart';


final galleryGetIt = GetIt.instance;

void setUpGalleryDio() {
  galleryGetIt.registerLazySingleton<GalleryCubit>(
    () => GalleryCubit(galleryRepo: galleryGetIt()),
  );

  galleryGetIt.registerLazySingleton<GalleryRepo>(
    () => GalleryRepo(galleryGetIt()),
  );

}
