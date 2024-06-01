
import 'package:flutter/material.dart';
import 'package:sapdos_app/core/constants/timeslots.dart';
import 'package:sapdos_app/presentation/theme/color_schemes.dart';

class TimeSlotsGrid extends StatefulWidget {
  @override
  _TimeSlotsGridState createState() => _TimeSlotsGridState();
}

class _TimeSlotsGridState extends State<TimeSlotsGrid> {
  String _selectedTime = '';


  void _handleTimeChange(String? value) {
    setState(() {
      _selectedTime = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: 6/2,
      ),
      itemCount: timeSlots.length,
      itemBuilder: (context, index) {
        return TimeSlotCard(
          time: timeSlots[index],
          groupValue: _selectedTime,
          onChanged: _handleTimeChange,
        );
      },
    );
  }
}

class TimeSlotCard extends StatelessWidget {
  final String time;
  final String groupValue;
  final ValueChanged<String?> onChanged;

  TimeSlotCard({
    required this.time,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.fourth,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 4.0,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Radio<String>(
              value: time,
              groupValue: groupValue,
              onChanged: onChanged,
            ),
            SizedBox(width: 8.0),
            Text(
              time,
              style: TextStyle(fontSize: 20,fontFamily: 'Sans',fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}