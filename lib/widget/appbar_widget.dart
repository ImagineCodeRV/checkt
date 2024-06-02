import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AppbarWidget extends StatefulWidget {
  const AppbarWidget({super.key});

  @override
  State<AppbarWidget> createState() => _AppbarWidgetState();
}

class _AppbarWidgetState extends State<AppbarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
          onPressed: () {
            FirebaseAuth.instance.signOut();
          },
          icon: Icon(
            Icons.exit_to_app,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ],
    );
  }
}
