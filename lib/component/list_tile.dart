import 'package:flutter/material.dart';
import '../memo/memo.dart';

class ListTiles extends StatelessWidget {
  const ListTiles({
    Key? key,
    required this.index,
    required this.memo,
    required this.selectedIndex,
    required this.indexs,
  }) : super(key: key);

  final int index;
  final Memo memo;
  final int selectedIndex;
  final int indexs;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.black12,
      selected: index == selectedIndex,
      selectedColor: Colors.amber,
      selectedTileColor: Colors.amber,
      leading: Text(
        memo.day,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.start,
        style: const TextStyle(
          fontSize: 15,
          color: Color(0xFF2E2817),
        ),
      ),
      title: Text(
        (memo.appName == '') ? '新規メモ' : memo.appName,
        textAlign: TextAlign.start,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 18,
          color: Color(0xFF2E2817),
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        (memo.languageName == '') ? '' : memo.languageName,
        textAlign: TextAlign.start,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 15,
        ),
      ),
    );
  }
}
