import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../memo/memo.dart';
import 'package:get/get.dart';

class MemoWidgetController extends GetxController {
  final memos = <Memo>[].obs;
  final textController = TextEditingController();
  final int index;

  MemoWidgetController({
    required this.index,
  });

  @override
  void onInit() {
    super.onInit();

    textController.text == 'ああ';

    print(index);
  }

  void onTapLink(String url) async {
    //TODO 記入後の状態変化ができていない。
    if (url != '') {
      await launch(url);
    } else {
      Get.snackbar(
        "リンクが開けませんでした",
        "正しいURLを入力してください!!",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.white,
      );
    }
  }

  void onChanged(
      {required String word, required Memo memo, required int indexs}) {
    //wordの値だけを更新させたい。
    //print(word);

    final index = memos.indexOf(memo);
    memo.appName == word;

    final newMemo = memo.copyWith(
      id: memo.id,
      appName: word,
      languageName: memo.languageName,
      designUrlName: memo.designUrlName,
      linkUrlName: memo.linkUrlName,
      memo: memo.memo,
      day: memo.day,
    );

    // void updateText(String description, Todo todo) {
    //   final index = _todos.indexOf(todo);
    //   final newTodo = todo.copyWith(description: description);
    //   _todos.setAll(index, [newTodo]);
    // }

    // memos.add(newMemo);

    // final memo2 = Memo(
    //   appName: '1',
    //   languageName: '2',
    //   linkUrlName: '4 ',
    //   designUrlName: '5 ',
    //   memo: '66',
    //   day: memo.day,
    // );
    // memos.add(memo2);
    //
    // print(indexs);

    //memos[index].appName == word;

    //print(newMemo.appName);
    //print(memos[index].appName);
    //print(index);

    //memos.setAll(index, [newMemo]);
  }
}
