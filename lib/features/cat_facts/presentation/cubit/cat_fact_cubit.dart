// import 'dart:developer';

import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/networking/api_error_model.dart';
import '../../data/cat_fact_api_service.dart';
import '../../data/cat_fact_repo.dart';

part 'cat_fact_state.dart';

class CatFactCubit extends Cubit<CatFactState> {
  CatFactCubit({required this.catFactRepo}) : super(CatFactLoading());
 final CatFactRepo catFactRepo;

  Future<void> fetchCatFact() async {
    log("Calling fetchCatFact...");
    emit(CatFactLoading());
  
      final catFacts = await catFactRepo.fetchCatFact();
    catFacts.when(
      onSuccess: (CatFactResponse data) {  
        log("Fetched ${data.data.length} cat facts");
        emit(CatFactLoaded(data));
      }, onError: (ApiErrorModel error) { 
        log("Failed to load facts: ${error.message}");
        emit(CatFactError(error.message!));
       }

    );
   
  }
  

}
