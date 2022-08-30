import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../repositories/repositories.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState>{
  final AuthRepository _authRepository;

  ResetPasswordCubit({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(ResetPasswordState.initial());

  void emailChanged(String value) {
    emit(state.copyWith(email: value, status: ResetStatus.initial));
  }

  void resetPassword() async{
    if(!state.isValid) return ;
    try{
      await _authRepository.resetPassword(
        email: state.email,
      );

      emit(state.copyWith(status: ResetStatus.success));
    } catch (_) {}
  }
}