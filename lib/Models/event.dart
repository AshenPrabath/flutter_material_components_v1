// event.dart

import 'package:flutter/material.dart';

class Event {
  final int id;
  final String eventTitle;
  final String eventImage;
  final String ticketType;
  final DateTime eventDate;
  final TimeOfDay eventTime;
  final String ownerName;
  final String eventVenue;
  final int ticketPrice;
  final int ticketCount;

  Event({
    required this.id,
    required this.eventTitle,
    required this.eventImage,
    required this.ticketType,
    required this.eventDate,
    required this.eventTime,
    required this.ownerName,
    required this.eventVenue,
    required this.ticketPrice,
    required this.ticketCount,
  });
}
