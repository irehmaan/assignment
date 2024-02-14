part of 'auth_bloc.dart';

enum FormStatus { initial, pending, success, error }

@immutable
final class AuthState {
  AuthState({
    this.email = '',
    this.password = '',
    this.formStatus = FormStatus.initial,
    this.errorMsg,
  });
  final String email;
  final String password;
  final FormStatus formStatus;
  final String? errorMsg;

  AuthState copyWith({
    String? email,
    String? password,
    FormStatus? formStatus,
    String? errorMsg,
  }) =>
      AuthState(
          email: email ?? this.email,
          password: password ?? this.password,
          formStatus: formStatus ?? this.formStatus,
          errorMsg: errorMsg ?? this.errorMsg);
}
