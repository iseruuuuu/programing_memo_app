import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../memo/memo.dart';
import 'package:get/get.dart';

class MemoWidgetController extends GetxController {
  final memos = <Memo>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  void onTapLink(String url) async {
    //TODO 記入後の状態変化ができていない。
    print(url);

    if (url.isEmpty) {
      var i =
          'https://www.figma.com/file/eMIR6ZMPXwzSHVICJyxMYj/Untitled?node-id=101%3A2';
      await launch(i);
    } else {
      Get.snackbar(
        "リンクが開けませんでした",
        "正しいURLを入力してください!!",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.white,
      );
    }
  }

  void onChanged({required String word, required Memo memo}) {
    print(memo.id);
    final index = memos.indexOf(memo);
    final newMemo = memo.copyWith(
      id: memo.id,
      appName: word,
      languageName: memo.languageName,
      designUrlName: memo.designUrlName,
      linkUrlName: memo.linkUrlName,
      memo: memo.memo,
      day: memo.day,
    );
    memos.setAll(index, [newMemo]);
  }
}
