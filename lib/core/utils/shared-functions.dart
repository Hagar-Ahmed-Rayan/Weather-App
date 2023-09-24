
import 'package:flutter/material.dart';

void navto(BuildContext context, Widget Screen) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Screen),
  );
}