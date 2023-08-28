import 'package:flutter/material.dart';
import 'package:flutter_material_components_v1/widgets/event_card.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EventCard(),
    );
  }
}
