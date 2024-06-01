part of 'payment_bloc.dart';

abstract class PaymentMethodState extends Equatable {
  const PaymentMethodState();

  @override
  List<Object> get props => [];
}

class PaymentMethodInitial extends PaymentMethodState {}

class PaymentMethodSelected extends PaymentMethodState {
  final String method;

  const PaymentMethodSelected(this.method);

  @override
  List<Object> get props => [method];
}

class PaymentSucess extends PaymentMethodState {}
