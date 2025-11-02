part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeLoading extends HomeState {}
class HomeLoaded extends HomeState {
  final List<CatModel> featuredCatsSection;
  final List<CatModel> breedsCatsSection;

  const HomeLoaded({required this.featuredCatsSection,required this.breedsCatsSection});

  @override
  List<Object> get props => [
        featuredCatsSection,
        breedsCatsSection,
  ];
  
}
class HomeFailed extends HomeState {
  final String errorMessage;

  const HomeFailed(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
