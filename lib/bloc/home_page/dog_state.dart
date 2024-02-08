

import 'package:equatable/equatable.dart';
import 'package:flutter_application_2_dogapp/model/dog_model.dart';


abstract class DogState extends Equatable {
  const DogState();

  @override
  List<Object> get props => [];
}

class DogInitial extends DogState {}

class DogLoading extends DogState {}

class DogLoaded extends DogState {
   Dog dog;

  DogLoaded(  {required this.dog});

  @override
  List<Object> get props => [dog];
}

class DogError extends DogState {
  final String message;

  DogError(this.message);

  @override
  List<Object> get props => [message];
}