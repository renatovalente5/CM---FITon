import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../core.dart';

class DateFormField extends StatelessWidget {
  const DateFormField({
    @required this.controller,
    @required this.labelText,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.validator,
    this.hintText,
    this.firstDate,
    this.initialDate,
    this.lastDate,
    this.initialDatePickerMode,
    Key key,
  }) : super(key: key);

  final CrossAxisAlignment crossAxisAlignment;
  final TextEditingController controller;
  final String labelText, hintText;
  final DateTime firstDate, initialDate, lastDate;
  final DatePickerMode initialDatePickerMode;
  final String Function(String) validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(
          labelText,
          style: TextStyle(color: kFirstColor.withOpacity(0.7), fontSize: 18),
        ),
        const SizedBox(height: 4),
        InkWell(
          onTap: () async {
            int year = DateTime.now().year;
            showDatePicker(
                context: context,
                firstDate: firstDate ?? DateTime(year - 100),
                initialDate: initialDate ?? DateTime(year - 5, 8, 17),
                lastDate: lastDate ?? DateTime(year - 4, 12, 17),
                initialDatePickerMode:
                    initialDatePickerMode ?? DatePickerMode.year,
                currentDate: DateTime.now(),
                builder: (_, child) {
                  return Theme(data: ThemeData.dark().copyWith(), child: child);
                }).then((date) {
              if (date != null) {
                final dateFormatOnShow = DateFormat("dd-MM-yyyy");
                controller.text = dateFormatOnShow.format(date);
                // final dateFormatOnInsert = DateFormat("yyyy-MM-dd");
                // onDateSelected(dateFormatOnInsert.format(date));
                // debugPrint(df.format(date));
              }
            });
          },
          child: AbsorbPointer(
            child: TextFormField(
              controller: controller,
              validator: validator,
              style: TextStyle(color: Colors.white70),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(color: Colors.white70),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF707070)),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF707070)),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
