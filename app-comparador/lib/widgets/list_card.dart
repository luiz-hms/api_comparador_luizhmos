import 'package:flutter/material.dart';

class ListCard extends StatelessWidget {
  final Widget title;
  final Widget subtitle;
  final String? imageLink;
  const ListCard(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.imageLink});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: ListTile(
            titleTextStyle: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black),
            title: title,
            subtitle: subtitle,
            subtitleTextStyle: const TextStyle(
                fontWeight: FontWeight.w400, color: Colors.black38),
            leading: CircleAvatar(
              child: Image.network(imageLink ?? ""),
            ),
          ),
        ),
      ),
    );
  }
}
