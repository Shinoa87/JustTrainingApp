
 part of 'signup_qubit.dart';

 enum SignupStatus {initial, submitting, success, error}

 class SignupState extends Equatable{

   final String email;
   final String password;
   final String username;
   final SignupStatus status;
   // final User? user;

   const SignupState({
     required this.email,
     required this.username,
     required this.password,
     required this.status,
     // this.user
   });

   factory SignupState.initial() {
     return const SignupState(
       email: '',
       password: '',
       username: '',
       status: SignupStatus.initial,
       // user: null,
     );
   }

   SignupState copyWith({
     String? email,
     String? password,
     String? username,
     SignupStatus? status,
     // User? user,
 }){
     return SignupState(
       email: email ?? this.email,
       username: username ?? this.username,
       password: password ?? this.password,
       status: status ?? this.status,
       // user: user ?? this.user,
     );
   }

   bool get isValid => email.isNotEmpty && password.isNotEmpty;

   @override
   List<Object?> get props => [
     email,
     password,
     username,
     status,
     // user,
   ];
 }
