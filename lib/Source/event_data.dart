// event_data.dart

import 'package:flutter/material.dart';
import 'package:flutter_material_components_v1/Models/event.dart';

List<Event> dummyEvents = [
  Event(
      id: 1,
      eventTitle: "Green Fiesta 2023",
      eventImage: 'lib/assets/media (2).png',
      ticketType: "VIP",
      eventDate: DateTime.now(),
      eventTime: TimeOfDay.now(),
      ownerName: "Dilshan Perera",
      eventVenue: "NSBM Sports Ground",
      ticketPrice: 3000,
      ticketCount: 3),
  Event(
      id: 2,
      eventTitle: "Prana 2023",
      eventImage: 'lib/assets/media (4).png',
      ticketType: "Normal",
      eventDate: DateTime.now(),
      eventTime: TimeOfDay.now(),
      ownerName: "Dilshan Perera",
      eventVenue: "NSBM Sports Ground",
      ticketPrice: 2000,
      ticketCount: 1),
];
