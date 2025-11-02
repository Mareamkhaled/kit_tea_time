part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeLoading extends HomeState {}
class HomeLoaded extends HomeState {
  final List<CatModel> cats;

  const HomeLoaded(this.cats);

  @override
  List<Object> get props => [
    cats,
  ];
  
}
class HomeFailed extends HomeState {
  final String errorMessage;

  const HomeFailed(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
