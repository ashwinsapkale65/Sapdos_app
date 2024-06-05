import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sapdos_app/features/bookappointment/presentation/bloc/bloc/payment_bloc.dart';

import 'package:sapdos_app/presentation/theme/color_schemes.dart';
import 'package:sapdos_app/presentation/theme/font_schemes.dart';

class PaymentCard extends StatefulWidget {
  const PaymentCard({super.key});

  @override
  State<PaymentCard> createState() => _PaymentCardState();
}

class _PaymentCardState extends State<PaymentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.25,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Enter Your Details Below",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: AppFonts.secondary,
                color: AppColors.primary),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
              decoration: InputDecoration(
            hintText: "Card Number",
            hintStyle:
                TextStyle(fontFamily: AppFonts.secondary, color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: AppColors.primary,
              ),
            ),
          )),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Card Holder",
                    hintStyle: TextStyle(
                      fontFamily: AppFonts.secondary,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 5),
              Expanded(
                flex: 1,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "MM/YY",
                    hintStyle: TextStyle(
                      fontFamily: AppFonts.secondary,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 5),
              Expanded(
                flex: 1,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "CVV",
                    hintStyle: TextStyle(
                      fontFamily: AppFonts.secondary,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              BlocProvider.of<PaymentMethodBloc>(context)
                  .add(PaymentSubmitted());
            },
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.primary,
                ),
                width: MediaQuery.of(context).size.width * 0.15,
                height: MediaQuery.of(context).size.height * 0.05,
                child: Center(
                  child: Text(
                    "Pay Now",
                    style: TextStyle(
                        color: AppColors.secondary,
                        fontFamily: AppFonts.secondary,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          )
        ]));
  }
}
