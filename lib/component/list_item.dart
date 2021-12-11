import 'package:flutter/material.dart';
import '../memo/memo.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    Key? key,
    required this.index,
    required this.memo,
    required this.selectedIndex,
  }) : super(key: key);

  final int index;
  final Memo memo;
  final int selectedIndex;

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
          color: (index == selectedIndex)
              ? const Color(0xFFFFE080)
              : const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                (memo.languageName == '')
                    ? '新規メモ'
                    : memo.appName,
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
                    memo.day,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF2E2817),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    (memo.languageName == '')
                        ? '追加テキストなし'
                        : memo.languageName,
                    maxLines: 15,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
