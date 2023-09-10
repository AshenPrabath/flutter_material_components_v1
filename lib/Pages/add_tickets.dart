import 'package:flutter/material.dart';

import 'package:flutter_material_components_v1/Models/event_model.dart';
import 'package:flutter_material_components_v1/Models/ticket_model.dart';
import 'package:flutter_material_components_v1/Source/event_data.dart';
import 'package:flutter_material_components_v1/Source/ticket_data.dart';
import 'package:flutter_material_components_v1/widgets/add_tickets_dialog.dart';
import 'package:flutter_material_components_v1/widgets/ticket_card.dart';

class AddTicket extends StatefulWidget {
  final Event event;
  const AddTicket({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  State<AddTicket> createState() => _AddTicketState();
}

class _AddTicketState extends State<AddTicket> {
  void _addTicket(Ticket newTicket) {
    setState(() {
      ticketsList.add(newTicket); // Add the ticket to the ticketsList
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        title: Text(
          "Add tickets",
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              "Publish",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Theme.of(context).colorScheme.primary),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: ticketsList.length, // Use ticketsList here
        itemBuilder: (context, index) {
          return TicketCard(
            event: widget.event,
            ticket: ticketsList[index],
          ); // Use ticketsList here
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AddTicketDialog(
                onTicketAdded: _addTicket,
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
