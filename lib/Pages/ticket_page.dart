import 'package:flutter/material.dart';
import 'package:flutter_material_components_v1/widgets/ticket.dart';

class TicketPage extends StatelessWidget {
  const TicketPage({super.key});

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
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(23.0),
          child: TicketWidget(),
        ),
      ),
    );
  }
}
