part of 'reg_in_bloc.dart';

@immutable
abstract class RegInEvent {}

class RegInPressed extends RegInEvent{
  final String? name;
  final String? phone;
  final String? email;
  final String? password;

  RegInPressed({
    required this.name,
    required this.phone,
    required this.email,
    required this.password
  });
}