import 'dart:convert';

import 'package:flutter_material_components_v1/Models/event_model.dart';
import 'package:flutter_material_components_v1/Source/fake_events.dart';

class EventService {
  static Future<List<Event>> getAll() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      final List<dynamic> res = json.decode(eventRes);
      final List<Event> events =
          res.map((e) => Event.fromMap(e as Map<String, dynamic>)).toList();
      return events;
    } catch (e) {
      throw e.toString();
    }
  }
}
