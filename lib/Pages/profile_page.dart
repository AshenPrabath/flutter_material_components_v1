import 'package:flutter/material.dart';
import 'package:flutter_material_components_v1/widgets/profile_data.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        title: Text(
          "Profile",
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 23),
        child: ProfileData(),
      ),
    );
  }
}
