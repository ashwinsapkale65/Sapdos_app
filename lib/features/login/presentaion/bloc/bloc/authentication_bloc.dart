import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<LoginRequested>(_onLoginRequested);
  }

  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(AuthenticationLoading());
    try {
      final String response =
          await rootBundle.loadString('assets/images/users.json');
      final List<dynamic> users = json.decode(response);

      final user = users.firstWhere(
        (user) =>
            user['email'] == event.email && user['password'] == event.password,
        orElse: () => null,
      );

      if (user != null) {
        emit(AuthenticationSuccess(role: user['role']));
      } else {
        emit(AuthenticationFailure(error: "Invalid email or password"));
      }
    } catch (e) {
      emit(AuthenticationFailure(error: "An error occurred"));
    }
  }
}
