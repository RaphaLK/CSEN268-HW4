import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(LoggedOut()) {
    on<AuthEvent>((event, emit) {
      on<Login>((event, emit) => emit(LoggedIn()));
      on<Logout>((event, emit) => emit(LoggedOut()));
    });
  }
}
