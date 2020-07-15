import 'package:flutter/material.dart';

// POP UP MENU DATA CLASS

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Edit Karein', icon: Icons.edit ),
  const Choice(title: 'Khata Download Karein', icon: Icons.picture_as_pdf),
  const Choice(title: 'Khata Share Karein', icon: Icons.share),
  const Choice(title: 'App Share Kareing', icon: Icons.message),
];


