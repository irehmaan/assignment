part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class EmailChanged extends AuthEvent {
  EmailChanged(this.email);

  final String email;
}

final class PasswordChanged extends AuthEvent {
  PasswordChanged(this.password);
  final String password;
}

final class FormSubmit extends AuthEvent {}

final class LogOut extends AuthEvent {}
