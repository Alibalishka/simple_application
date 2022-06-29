import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/src/router/routing_const.dart';
import 'package:meta/meta.dart';

part 'reg_in_event.dart';
part 'reg_in_state.dart';

class RegInBloc extends Bloc<RegInEvent, RegInState> {
  RegInBloc({
    required this.dio,
  }) : super(RegInInitial());

  final Dio dio;
  
  @override
  Stream<RegInState> mapEventToState(
    RegInEvent event,
  ) async*{
    if(event is RegInPressed){
      yield RegInLoading();
      print('Я работаю');
      try{
        Response response = await dio.post(
          'auth/registration/customer/new',
          data: {
            'email': event.email,
            'nickname': event.name,
            'phone': event.phone,
            'password': event.password,
          }
        );
        yield RegInLoaded();
      } on DioError catch(e){
        yield RegInFailed(errmessage: 'Не удалось зарегистрировать пользователя!');
        throw e;
      }catch(e){
        yield RegInFailed(errmessage: 'Произошла ошибка!');
        throw e;
      }
    }
  }
}
