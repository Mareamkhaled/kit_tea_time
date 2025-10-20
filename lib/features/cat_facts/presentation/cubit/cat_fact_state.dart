part of 'cat_fact_cubit.dart';

@immutable
sealed class CatFactState {}

final class CatFactLoading extends CatFactState {}

final class CatFactLoaded extends CatFactState {
  final CatFactResponse catFact;
  CatFactLoaded(this.catFact);
}

final class CatFactError extends CatFactState {
  final String message;
  CatFactError(this.message);
}
