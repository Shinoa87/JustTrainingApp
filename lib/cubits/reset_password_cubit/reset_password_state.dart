part of 'reset_password_cubit.dart';

enum ResetStatus {initial, submitting, success, error}

class ResetPasswordState extends Equatable{

  final String email;
  final ResetStatus status;

  const ResetPasswordState({
    required this.email,
    required this.status,
  });

  factory ResetPasswordState.initial() {
    return const ResetPasswordState(
      email: '',
      status: ResetStatus.initial,
    );
  }

  ResetPasswordState copyWith({
    String? email,
    String? password,
    ResetStatus? status,
  }){
    return ResetPasswordState(
      email: email ?? this.email,
      status: status ?? this.status,
    );
  }

  bool get isValid => email.isNotEmpty;

  @override
  List<Object> get props => [
    email,
    status,
  ];
}