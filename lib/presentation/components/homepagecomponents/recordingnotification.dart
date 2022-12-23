import 'package:flutter/material.dart';
import 'package:scare/presentation/utils/constants.dart';

class AppNotification extends StatelessWidget {
  const AppNotification({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          message,
          style: kmediumstyle,
        ),
      ),
    );
  }
}
