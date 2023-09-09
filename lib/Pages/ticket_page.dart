import 'package:flutter/material.dart';
import 'package:flutter_material_components_v1/Models/event.dart';

import 'package:flutter_material_components_v1/widgets/ticket.dart';

class TicketPage extends StatelessWidget {
  final Event event;
  const TicketPage({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        title: Text(
          "Ticket Information",
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(23.0),
        child: TicketWidget(event: event),
      ),
    );
  }
}
