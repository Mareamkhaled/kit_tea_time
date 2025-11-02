import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/cat_model.dart';
import '../../data/repositories/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.homeRepo}) : super(HomeLoading());
  HomeRepo homeRepo;

  Future<void> fetchCatImages() async {
    emit(HomeLoading());
    final result = await homeRepo.getCatImages();
    result.when(
      onSuccess: (cats) {
        emit(HomeLoaded(
          featuredCatsSection: cats.sublist(0,5),
          breedsCatsSection: cats.sublist(5, cats.length),
        ));
      },
      onError: (error) {
        emit(HomeFailed(error.toString()));
      },
    );
  }
}
