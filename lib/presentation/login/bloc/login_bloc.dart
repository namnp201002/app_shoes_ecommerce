import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    on<LoginClickedButton>((event, emit) {
      emit(LoginLoadingState());

      if (true) {
        emit(LoginSuccessState());
      }
      emit(LoginFailureState());
    });
  }
}
