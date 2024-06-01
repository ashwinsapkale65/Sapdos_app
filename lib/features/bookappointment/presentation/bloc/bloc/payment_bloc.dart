import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentMethodBloc extends Bloc<PaymentMethodEvent, PaymentMethodState> {
  PaymentMethodBloc() : super(PaymentMethodInitial()) {
    on<SelectPaymentMethod>((event, emit) {
      emit(PaymentMethodSelected(event.method));
    });

    on<PaymentSubmitted>((event, emit) {
      emit(PaymentSucess());
    });
  }
}
