import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    Key key,
    this.title,
    this.day,
    this.content,
    this.index,
  }) : super(key: key);

  final String title;
  final String day;
  final String content;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFFFFFFFF),
            width: 2,
          ),
          color:
              (index == 0) ? const Color(0xFFFFE080) : const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 15,
                  color: Color(0xFF2E2817),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Text(
                    day,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF2E2817),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    content,
                    maxLines: 15,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
