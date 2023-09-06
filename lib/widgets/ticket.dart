import 'package:flutter/material.dart';
import 'package:flutter_material_components_v1/widgets/custom_filled_button.dart';

class TicketWidget extends StatelessWidget {
  const TicketWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const double borderRadius = 6.0;
    return Container(
      height: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: Theme.of(context)
              .colorScheme
              .outlineVariant, // Change the border color as needed
          width: 1.0, // Adjust the border width as needed
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(borderRadius),
                  child: Image.asset(
                    'lib/assets/media (5).png',
                    height: 102,
                    width: 102,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 11),
                        child: Text(
                          "Green Fiesta 2023",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onSurface),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Theme.of(context)
                                .colorScheme
                                .outlineVariant, // Change the border color as needed
                            width: 1.0, // Adjust the border width as needed
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 6),
                          child: Text(
                            "VIP",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 21),
              child: Container(
                width: 500, // Adjust the width of the dashed line
                height: 2, // Adjust the height of the dashed line
                decoration: const BoxDecoration(),
                child: CustomPaint(
                  painter: DashedLinePainter(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Date",
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface),
                      ),
                      Padding(
                          padding: EdgeInsets.only(bottom: 21),
                          child: Text(
                            "20-08-2023",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface),
                          )),
                      Text(
                        "Name",
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 21),
                        child: Text(
                          "Dilshan Perera",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onSurface),
                        ),
                      ),
                      Text(
                        "Ticket Price",
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface),
                      ),
                      Text(
                        "3000 LKR",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Time",
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 21),
                        child: Text(
                          "6.00 pm",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onSurface),
                        ),
                      ),
                      Text(
                        "Venue",
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 21),
                        child: Text(
                          "NSBM Sports Ground",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onSurface),
                        ),
                      ),
                      Text(
                        "NO of tickets",
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface),
                      ),
                      Text(
                        "3",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  child: Center(
                      child: Text(
                    "Total Price 9000 LKR",
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer),
                  )),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Image.asset(
                'lib/assets/Barcode-PNG-Photo 1.png',
                width: 319,
                height: 95,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: CustomFilledButton(
                  onPressed: () {}, buttonText: "Download Ticket"),
            )
          ],
        ),
      ),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.black // Change the line color as needed
      ..strokeWidth = 1.0 // Adjust the line width as needed
      ..style = PaintingStyle.stroke;

    const double dashWidth = 5.0; // Adjust the dash width
    const double dashSpace = 3.0; // Adjust the dash spacing

    double startX = 0.0;
    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, 0.0),
        Offset(startX + dashWidth, 0.0),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}