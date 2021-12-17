import 'package:flutter/material.dart';
import '../controller.dart';
import '../memo/memo.dart';
import 'package:get/get.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    Key? key,
    required this.index,
    required this.memo,
    required this.selectedIndex,
    required this.color,
  }) : super(key: key);

  final int index;
  final Memo memo;
  final int selectedIndex;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Controller(), tag: '');
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFFFFFFFF),
            width: 2,
          ),
          //color: color,
          color: controller.selected[index] ? Colors.blue : Colors.grey,
          // color: (index == selectedIndex)
          //     ? const Color(0xFFFFE080)
          //     : const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                memo.day,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 15,
                  color: Color(0xFF2E2817),
                ),
              ),
              Text(
                (memo.appName == '') ? '新規メモ' : memo.appName,
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 18,
                  color: Color(0xFF2E2817),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                (memo.languageName == '') ? '' : memo.languageName,
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
