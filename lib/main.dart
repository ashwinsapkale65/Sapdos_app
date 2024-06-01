import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sapdos_app/features/bookappointment/presentation/bloc/bloc/payment_bloc.dart';
import 'package:sapdos_app/features/doctordashboard/presentation/bloc/bloc/schedule_bloc.dart';
import 'package:sapdos_app/features/doctordashboard/presentation/pages/doctor_dashboard_page.dart';
import 'package:sapdos_app/features/login/presentaion/bloc/bloc/authentication_bloc.dart';

import 'package:sapdos_app/features/onboarding/bloc/change_screen.dart';
import 'package:sapdos_app/features/onboarding/presentation/pages/onboarding_page.dart';

import 'package:sapdos_app/features/patientdashboard/presentation/pages/patient_dashboard_page.dart';

import 'package:sapdos_app/features/patientinfo/presentation/bloc/custom_expansion_tile_boc.dart';
import 'package:sapdos_app/features/patientinfo/presentation/pages/patien_info_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => OnboardingBloc()),
        BlocProvider(create: (context) => CustomExpansionTileBloc()),
        BlocProvider(create: (context) => PaymentMethodBloc()),
        BlocProvider(create: (context) => ScheduleBloc()..add(LoadSchedule())),
        BlocProvider(create: (context) => AuthenticationBloc()),
         
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: PatientDashboardPage(),
      ),
    );
  }
}
