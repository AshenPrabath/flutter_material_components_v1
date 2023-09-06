import 'package:flutter/material.dart';
import 'package:flutter_material_components_v1/Pages/ticket_page.dart';

class TicketMiniCard extends StatelessWidget {
  final String imageLocation;
  final String eventTitle;
  final String ticketType;
  const TicketMiniCard({
    Key? key,
    required this.imageLocation,
    required this.eventTitle,
    required this.ticketType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double borderRadius = 12.0;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const TicketPage()),
        );
      },
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(
            color: Theme.of(context)
                .colorScheme
                .outlineVariant, // Change the border color as needed
            width: 1.0, // Adjust the border width as needed
          ),
        ),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        eventTitle,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                color: Theme.of(context).colorScheme.onSurface),
                      ),
                      Text(
                        ticketType,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            ClipRRect(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(borderRadius),
                    bottomRight: Radius.circular(borderRadius)),
                child: Image.asset(
                  imageLocation,
                  height: 80,
                  width: 80,
                )),
          ],
        ),
      ),
    );
  }
}
