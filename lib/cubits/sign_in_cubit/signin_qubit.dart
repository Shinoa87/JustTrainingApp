 import 'package:flutter_bloc/flutter_bloc.dart';
 import 'package:equatable/equatable.dart';
 import '../../repositories/repositories.dart';

 part 'signin_state.dart';

 class SigninCubit extends Cubit<SigninState>{
   final AuthRepository _authRepository;

   SigninCubit({required AuthRepository authRepository})
       : _authRepository = authRepository,
         super(SigninState.initial());

   void emailChanged(String value) {
     emit(state.copyWith(email: value, status: SigninStatus.initial));
   }

   void passwordChanged(String value) {
     emit(state.copyWith(password: value, status: SigninStatus.initial));
   }

   void signinWithCredentials() async{
     if(!state.isValid) return ;
     try{
       await _authRepository.signIn(
           email: state.email,
           password: state.password,
       );

       emit(state.copyWith(status: SigninStatus.success));
     } catch (_) {}
   }
 }