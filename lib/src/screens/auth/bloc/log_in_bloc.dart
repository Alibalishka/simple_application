import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/src/common/models/tokens_model.dart';
import 'package:flutter_application_1/src/common/models/user_model.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'log_in_event.dart';
part 'log_in_state.dart';

class LogInBloc extends Bloc<LogInEvent, LogInState> {
  final Dio dio;
  
  LogInBloc({
    required this.dio,
  }) : super(LogInInitial());

  final Box tokensBox = Hive.box('tokens');
  
  @override
  Stream<LogInState> mapEventToState(
    LogInEvent event,
  ) async* {
    if(event is LogInPressed){
      yield LogInLoading();
      // print('Я работаю');
      try{
        Response response = await dio.post(
          // Заменили полную ссылку на endpoint, т.к. в GetIt уже стоит основная ссылка
          // Мы к ней добавляем путь 'auth/login'
          'auth/login',
          data: {
            'email': event.email,
            'password': event.password,
          },
        );

        TokensModel tokensModel = TokensModel.fromJson(
          response.data['tokens'],
        );
        UserModel userModel = UserModel.fromJson(
          response.data['user'],
        );

        tokensBox.put('access', tokensModel.access);
        tokensBox.put('refresh', tokensModel.refresh);
        tokensBox.put('name', userModel.nickname);
        tokensBox.put('email', userModel.email);

        yield LogInLoaded();
      }on DioError catch(e){
        yield LogInFailed(errMessage: 'Неправильный логин или пароль');
        throw e;
      }catch (e){
        yield LogInFailed(errMessage: 'Произошла ошибка');
        throw e;
      }
    }
  }
}
