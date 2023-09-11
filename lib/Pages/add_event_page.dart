import 'package:flutter/material.dart';
import 'package:flutter_material_components_v1/Models/event_model.dart';

import 'package:flutter_material_components_v1/Pages/add_tickets.dart';
import 'package:flutter_material_components_v1/widgets/custom_filled_button.dart';
import 'package:flutter_material_components_v1/widgets/date_picker_textfield.dart';
import 'package:flutter_material_components_v1/widgets/input_large_textfield.dart';
import 'package:flutter_material_components_v1/widgets/input_textfield.dart';
import 'package:flutter_material_components_v1/widgets/time_picker_textfield.dart';

class AddEventPage extends StatefulWidget {
  final Event events;
  const AddEventPage({
    Key? key,
    required this.events,
  }) : super(key: key);

  @override
  State<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  TimeOfDay? time;
  String? eventTitle;
  DateTime? date;
  String buttonText = "Publish as a free event";
  final TextEditingController _descText = TextEditingController();
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
                  overflowSpacing: 15,
                  children: [
                    const SizedBox(),
                    InputTextField(
                      labelText: "Event Title",
                      hint: "Give a title to the event",
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
                    InputTextField(
                      labelText: "Venue",
                      hint: "Enter the location ",
                      suffixIcon: Icons.location_on_outlined,
                      onChanged: (value) {},
                    ),
                    InputLargeTextField(
                      controller: _descText,
                      maxLength: 250,
                    ),
                    InputTextField(
                      labelText: "External Link",
                      hint: "Paste if you have any external Links.",
                      helperText: "*Optional",
                      suffixIcon: Icons.link,
                      onChanged: (value) {},
                    ),
                    OverflowBar(
                      overflowSpacing: 7,
                      children: [
                        CustomFilledButton(
                            onPressed: () async {
                              final res = await saveToDatabase();
                              setState(() {
                                buttonText = res;
                              });
                            },
                            buttonText: buttonText),
                        Center(
                          child: Text(
                            "or",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground),
                          ),
                        ),
                        CustomFilledButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddTicket(
                                  event: widget.events,
                                ),
                              ),
                            );
                          },
                          buttonText: "Add Tickets",
                          buttonColor:
                              Theme.of(context).colorScheme.secondaryContainer,
                          buttonTextColor: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer,
                        ),
                        const SizedBox(
                          height: 50,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _descText.dispose();
    super.dispose();
  }
}
