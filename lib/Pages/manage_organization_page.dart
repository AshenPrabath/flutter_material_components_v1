import 'package:flutter/material.dart';
import 'package:flutter_material_components_v1/widgets/organization_data.dart';

class ManageOrganizationPage extends StatefulWidget {
  const ManageOrganizationPage({super.key});

  @override
  State<ManageOrganizationPage> createState() => _ManageOrganizationPageState();
}

class _ManageOrganizationPageState extends State<ManageOrganizationPage> {
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: OrganizationData(),
            ),
          ],
        ),
      ),
    );
  }
}
