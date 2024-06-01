import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sapdos_app/presentation/theme/color_schemes.dart';

class DatpickerContainerWidget extends StatefulWidget {
  const DatpickerContainerWidget({Key? key}) : super(key: key);

  @override
  _DatpickerContainerWidgetState createState() =>
      _DatpickerContainerWidgetState();
}

class _DatpickerContainerWidgetState extends State<DatpickerContainerWidget> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  String _formatDate(DateTime date) {
    return DateFormat('EEEE, MMMM d').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
              _formatDate(_selectedDate),
              style: TextStyle(color: Colors.white),
            ),
          ),
          GestureDetector(
            onTap: () => _selectDate(context),
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
              ),
              child: Icon(
                Icons.calendar_month,
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
