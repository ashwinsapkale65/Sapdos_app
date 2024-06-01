part of 'payment_bloc.dart';

abstract class PaymentMethodEvent extends Equatable {
  const PaymentMethodEvent();

  @override
  List<Object> get props => [];
}

class SelectPaymentMethod extends PaymentMethodEvent {
  final String method;

  const SelectPaymentMethod(this.method);

  @override
  List<Object> get props => [method];
}

class PaymentSubmitted extends PaymentMethodEvent {}
