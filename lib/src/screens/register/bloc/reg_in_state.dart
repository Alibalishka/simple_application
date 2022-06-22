part of 'reg_in_bloc.dart';

@immutable
abstract class RegInState {}

class RegInInitial extends RegInState {}

class RegInLoading extends RegInState{}

class RegInLoaded extends RegInState{}

class RegInFailed extends RegInState{
  final String? errmessage;

  RegInFailed({
    required this.errmessage,
  });
}