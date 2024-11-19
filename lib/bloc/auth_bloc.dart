import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequest>(_onAuthLogin);
    on<AuthLogout>((event, emit) => _logOut(emit),);
  }
  
  void _onAuthLogin(AuthLoginRequest event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final email = event.email;
    final password = event.password;
    if (password.length < 6) {
      emit(AuthError(errorMsg: "Password must be in 6 letters"));
    }else{
      await Future.delayed(Duration(seconds: 1));
      emit(AuthSuccess(uid: "$email - $password"));
    }
  }

  Future<void> _logOut(Emitter<AuthState> emit) async {
    emit(AuthLoading());
    await Future.delayed(Duration(seconds: 1));
    emit(AuthInitial());
  }
}
