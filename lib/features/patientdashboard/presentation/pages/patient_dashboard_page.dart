import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sapdos_app/core/injector/dependency_injection.dart';
import 'package:sapdos_app/core/screens/custom_dashboard.dart';
import 'package:sapdos_app/features/patientdashboard/presentation/bloc/bloc/user_with_doctor_bloc.dart';
import 'package:sapdos_app/features/patientdashboard/presentation/widgets/doctor_cards.dart';
import 'package:sapdos_app/presentation/theme/color_schemes.dart';

class PatientDashboardPage extends StatefulWidget {
  const PatientDashboardPage({Key? key}) : super(key: key);

  @override
  State<PatientDashboardPage> createState() => _PatientDashboardPageState();
}

class _PatientDashboardPageState extends State<PatientDashboardPage> {
  @override
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<UserWithDoctorsBloc>()..add(FetchUserWithDoctors()),
      child: BlocBuilder<UserWithDoctorsBloc, UserWithDoctorsState>(
        builder: (context, state) {
          if (state is UserWithDoctorsLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            );
          } else if (state is UserWithDoctorsError) {
            return Text(state.message);
          }
          if (state is UserWithDoctorsLoaded) {
            return CustomDashboard(
              introTitle: state.userWithDoctors.user?.greeting ?? "",
              introSubtitle: state.userWithDoctors.user?.name ?? "",
              introImagePath: state.userWithDoctors.user?.avatar ?? "",
              belowCardWidgets: [
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          "Doctor's List",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.white,
                        ),
                        child: Icon(
                          Icons.sort,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.height * 0.62,
                  child: ProfileCardsGrid(
                    userDoctors: state.userWithDoctors.doctorsList!,
                  ),
                )
              ],
            );
          }

          return Container();
        },
      ),
    );
  }
}
