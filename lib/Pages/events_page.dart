import 'package:flutter/material.dart';
import 'package:flutter_material_components_v1/Models/event_model.dart';
import 'package:flutter_material_components_v1/Services/event_service.dart';
import 'package:flutter_material_components_v1/widgets/event_card.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
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
        // child: EventCard(event: EventService.getEvent()),
        child: FutureBuilder(
          future: EventService.getAllEvents(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final List<Event> events = snapshot.data!;

              return ListView.builder(
                  itemCount: events.length,
                  itemBuilder: (context, index) {
                    return EventCard(event: events[index]);
                  });
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
