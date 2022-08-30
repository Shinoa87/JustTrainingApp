import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repositories/repositories.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  StreamSubscription<auth.User?>? _userSubscription;

  AuthBloc(
      this._authRepository,
  ) : super(const AuthState.unknown()) {
    on<AuthUserChanged>(_onAuthUserChanged);

    _userSubscription = _authRepository.user.listen(
      (user) => add(
         AuthUserChanged(user: user),
        // AuthUserChanged(user: user!), почему-то выдает ошибку, вернешь если что, ошибка стало выдавать после того, как поменял контекст в мейне
      ),
    );
  }

  void _onAuthUserChanged(
    AuthUserChanged event,
    Emitter<AuthState> emit,
  ) async{
    event.user != null
        ? emit(AuthState.authenticated(user: event.user!))
        : emit(const AuthState.unauthenticated());
  }

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }
}
