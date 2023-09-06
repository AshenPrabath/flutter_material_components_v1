import 'package:flutter/material.dart';
import 'package:flutter_material_components_v1/widgets/event_card.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
          title: Text(
            "Events",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            children: const [
              EventCard(),
              EventCard(),
              EventCard(),
              EventCard(),
            ],
          ),
        ));
  }
}
