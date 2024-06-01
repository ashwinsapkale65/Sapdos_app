// book_appointment_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sapdos_app/features/bookappointment/presentation/bloc/bloc/payment_bloc.dart';
import 'package:sapdos_app/features/bookappointment/presentation/widgets/card_widget.dart';
import 'package:sapdos_app/features/bookappointment/presentation/widgets/sucess_widget.dart';
import 'package:sapdos_app/presentation/theme/color_schemes.dart';
import 'package:sapdos_app/presentation/theme/font_schemes.dart';

class BookAppointmentPage extends StatelessWidget {
  const BookAppointmentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> paymentMethods = ['Netbanking', 'Card', 'UPI'];

    return Scaffold(
      backgroundColor: Color.fromRGBO(203, 208, 227, 2),
      body: Stack(
        children: [
          Row(
            children: [
              Container(
                height: double.infinity,
                width: MediaQuery.of(context).size.width * 0.5,
                child:
                    Image.asset("assets/images/carenow.png", fit: BoxFit.cover),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                  ),
                ),
                height: double.infinity,
                width: MediaQuery.of(context).size.width * 0.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "SAPDOS",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 65,
                        fontFamily: AppFonts.primary,
                        color: AppColors.primary,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      "Book Appointment",
                      style: TextStyle(
                        fontSize: 50,
                        fontFamily: AppFonts.secondary,
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      height: 600,
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            BlocBuilder<PaymentMethodBloc, PaymentMethodState>(
                              builder: (context, state) {
                                String? selectedMethod;
                                if (state is PaymentMethodSelected) {
                                  selectedMethod = state.method;
                                }

                                return Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  child: DropdownButtonFormField<String>(
                                    decoration: InputDecoration(
                                      alignLabelWithHint: true,
                                      labelText: 'Select Payment Method',
                                      labelStyle: TextStyle(
                                        color: AppColors.primary,
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: AppColors.primary,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                    style: TextStyle(
                                      color: AppColors.primary,
                                    ),
                                    value: selectedMethod,
                                    onChanged: (value) {
                                      if (value != null) {
                                        context
                                            .read<PaymentMethodBloc>()
                                            .add(SelectPaymentMethod(value));
                                      }
                                    },
                                    items: paymentMethods.map((String method) {
                                      return DropdownMenuItem<String>(
                                        value: method,
                                        child: Text(method),
                                      );
                                    }).toList(),
                                  ),
                                );
                              },
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Expanded(
                              child: BlocBuilder<PaymentMethodBloc,
                                  PaymentMethodState>(
                                builder: (context, state) {
                                  if (state is PaymentMethodSelected) {
                                    switch (state.method) {
                                      case 'Card':
                                        return PaymentCard();
                                      case 'UPI':
                                        return Text(
                                          "UPI Payment Method Selected",
                                          style: TextStyle(
                                              color: AppColors.primary),
                                        );
                                      case 'Netbanking':
                                        return Text(
                                          "Netbanking Payment Method Selected",
                                          style: TextStyle(
                                              color: AppColors.primary),
                                        );
                                    }
                                  }
                                  return Container();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          BlocBuilder<PaymentMethodBloc, PaymentMethodState>(
            builder: (context, state) {
              if (state is PaymentSucess) {
                return SucessWidget();
              }
              return SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
