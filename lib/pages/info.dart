// ignore_for_file: avoid_unnecessary_containers

import "package:flutter/material.dart";

class InfoWidget extends StatelessWidget {
  const InfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Text(
          'Info View',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 50,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}
