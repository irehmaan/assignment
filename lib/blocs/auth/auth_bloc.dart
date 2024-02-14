import 'package:assignment/repo/auth_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this._auth_repo) : super(AuthState()) {
    on<EmailChanged>(_emailChanged);
    on<PasswordChanged>(_passwordChanged);
    on<FormSubmit>(_formChanged);
    on<LogOut>(_logOut);
  }
  final Auth_Repo _auth_repo;

  User? _currentUser;
  User? get currentUser => _currentUser;

  void _emailChanged(EmailChanged event, Emitter<AuthState> emit) {
    final newEmail = event.email;
    print(newEmail);
    emit(state.copyWith(email: newEmail));
  }

  void _passwordChanged(PasswordChanged event, Emitter<AuthState> emit) {
    emit(state.copyWith(password: event.password));
  }

  Future<void> _formChanged(FormSubmit event, Emitter<AuthState> emit) async {
    final email = state.email;
    final pass = state.password;

    if (email.isEmpty || pass.isEmpty) return;

    final user = await _auth_repo.signInWithEmailAndPass(email, pass);
    print("user $user");

    if (user != null) {
      _currentUser = user;
      emit(state.copyWith(formStatus: FormStatus.success));
    }
  }

  void _logOut(LogOut event, Emitter<AuthState> emit) async {
    _auth_repo.signOutUser();
  }
}
