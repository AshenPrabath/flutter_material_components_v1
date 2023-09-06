import 'package:flutter/material.dart';
import 'package:flutter_material_components_v1/widgets/ticket_minicard.dart';

class BookingsPage extends StatelessWidget {
  const BookingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        title: Text(
          "Bookings",
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: ListView(
          children: const [
            OverflowBar(
              overflowSpacing: 13,
              children: [
                SizedBox(height: 20),
                TicketMiniCard(
                    imageLocation: 'lib/assets/media (2).png',
                    eventTitle: "Green Fiesta 2023",
                    ticketType: "VIP"),
                TicketMiniCard(
                    imageLocation: 'lib/assets/media (4).png',
                    eventTitle: "Prana 2023",
                    ticketType: "Normal"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
