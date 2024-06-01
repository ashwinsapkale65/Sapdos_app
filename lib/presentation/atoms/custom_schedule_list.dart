// custom_schedule_item.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sapdos_app/features/doctordashboard/model/patient_model.dart';
import 'package:sapdos_app/features/patientinfo/presentation/pages/patien_info_page.dart';
import 'package:sapdos_app/presentation/theme/color_schemes.dart';

class CustomScheduleItem extends StatelessWidget {
  final ScheduleItemModel scheduleItem;

  const CustomScheduleItem({Key? key, required this.scheduleItem})
      : super(key: key);

  String _formatTime(DateTime time) {
    return DateFormat('h:mm a').format(time);
  }

  @override
  Widget build(BuildContext context) {
    Color clockColor;
    Color borderColor;
    bool showTickIcon;

    if (scheduleItem.isDue) {
      clockColor = Colors.red;
      borderColor = Colors.red;
      showTickIcon = false;
    } else if (scheduleItem.isCompleted) {
      clockColor = AppColors.primary;
      borderColor = AppColors.primary;
      showTickIcon = true;
    } else if (scheduleItem.isPending) {
      clockColor = Colors.green;
      borderColor = Colors.green;
      showTickIcon = false;
    } else {
      clockColor = Colors.grey;
      borderColor = Colors.grey;
      showTickIcon = false;
    }

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PatientInfoPage(
     
              scheduleItem: scheduleItem,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.fourth,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(Icons.timer, color: clockColor),
            ),
            SizedBox(width: 10),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.fourth,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    _formatTime(scheduleItem.time),
                    style: TextStyle(color: AppColors.primary, fontSize: 16),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: borderColor),
                ),
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      scheduleItem.patientName,
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    Text(
                      '${scheduleItem.age} years',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    if (showTickIcon)
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                        ),
                        child: Icon(Icons.check,
                            color: AppColors.primary, size: 16),
                      )
                    else
                      SizedBox(width: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
