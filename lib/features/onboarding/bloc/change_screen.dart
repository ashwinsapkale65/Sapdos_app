import 'package:flutter_bloc/flutter_bloc.dart';

abstract class OnboardingState {}

class InitialState extends OnboardingState {}

class LoginState extends OnboardingState {}

class RegisterState extends OnboardingState {}

abstract class OnboardingEvent {}

class LoginEvent extends OnboardingEvent {}

class RegisterEvent extends OnboardingEvent {}

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(InitialState()) {
    on<LoginEvent>((event, emit) => emit(LoginState()));
    on<RegisterEvent>((event, emit) => emit(RegisterState()));
  }
}
