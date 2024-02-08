

import 'package:bloc/bloc.dart';
import 'package:flutter_application_2_dogapp/bloc/home_page/dog_event.dart';
import 'package:flutter_application_2_dogapp/bloc/home_page/dog_state.dart';
import 'package:flutter_application_2_dogapp/service/api_service.dart';
import 'package:flutter_application_2_dogapp/utils/localstorage/sharedpref.dart';


// class DogBloc extends Bloc<DogEvent, DogState> {
//   final DogService _dogService = DogService();

//   DogBloc() : super(DogInitial());

//   get history => null;


  

class DogBloc extends Bloc<DogEvent, DogState> {
  final DogService _userRepository;

  // final DogService _dogService = DogService();
  // final Box<String> historyBox = Hive.box<String>('dog_history');

  DogBloc(this._userRepository) : super(DogInitial()) {
    on<FetchDog>(getDogApi);
  }

  getDogApi(event, emit) async {
    emit(DogLoading());
    try {
      final users = await _userRepository.getRandomDog();
      UserPrefrences.addToHistory(imageUrl: users.message);
      emit(DogLoaded( dog:users ));
    } catch (e) {
      emit(DogError(e.toString()));
    }
  }
}

  // @override
  // Stream<DogState> mapEventToState(DogEvent event) async* {
  //   if (event is FetchDog) {
  //     yield DogLoading(); 

  //     try {
  //       final Map<String, dynamic> response = await _dogService.getRandomDog();
  //       final  dog = Dog.fromJson(response);
  //       yield (DogLoaded(dog: null));
  //     } catch (e) {
  //       yield DogError('Failed to fetch dog image.');
  //     }
  //   }
  // }

