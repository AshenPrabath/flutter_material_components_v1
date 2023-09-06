import 'package:flutter/material.dart';
import 'package:flutter_material_components_v1/widgets/custom_filled_button.dart';
import 'package:flutter_material_components_v1/widgets/date_picker_textfield.dart';
import 'package:flutter_material_components_v1/widgets/input_textfield.dart';
import 'package:flutter_material_components_v1/widgets/time_picker_textfield.dart';

class AddEventPage extends StatefulWidget {
  const AddEventPage({super.key});

  @override
  State<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  TimeOfDay? time;
  String? eventTitle;
  DateTime? date;
  String buttonText = "Submit";
  Future<String> saveToDatabase() async {
    await Future.delayed(Duration(seconds: 3));
    return "succeed";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        title: Text(
          "Add Event",
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
        ),
      ),
      body: Form(
        child: ListView(
          children: [
            Image.asset('lib/assets/Group 9.png'),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: OverflowBar(
                  overflowSpacing: 20,
                  children: [
                    const SizedBox(),
                    InputTextField(
                      hint: "Event Title",
                      isPassword: false,
                      onChanged: (text) {
                        eventTitle = text;
                      },
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TimePickerTextField(
                          hint: "TIme",
                          onTimePicked: (pickedTime) {
                            time = pickedTime;
                          },
                        ),
                        const Spacer(),
                        DatePickerTextField(
                          hint: "Date",
                          onDatePicked: (pickedDate) {
                            date = pickedDate;
                          },
                        )
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        final value = await showTimePicker(
                            context: context, initialTime: TimeOfDay.now());
                        setState(() {
                          time = value;
                        });
                      },
                      child:
                          Text(time != null ? time.toString() : "Select Time"),
                    ),
                    CustomFilledButton(
                        onPressed: () async {
                          final res = await saveToDatabase();
                          setState(() {
                            buttonText = res;
                          });
                        },
                        buttonText: buttonText)
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
