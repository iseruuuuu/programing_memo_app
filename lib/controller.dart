import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../memo/memo.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../preference/storage_service/storeage_service.dart';

class Controller extends GetxController {
  final selectedIndex = 0.obs;
  final memos = <Memo>[].obs;
  final storage = TodoStorage();
  late final Worker worker;
  final colors = Colors.grey.obs;

  @override
  void onInit() {
    super.onInit();
    final storageMemos =
        storage.load()?.map((json) => Memo.fromJson(json)).toList();
    // SharedPreferencesにデータがなければダミー初期データをロード
    final initialMemos = storageMemos ?? Memo.initialTodos;
    _memos.addAll(initialMemos);

    // _todosに変化がある度にストレージに保存
    worker = ever<List<Memo>>(memos, (memos) {
      final data = memos.map((e) => e.toJson()).toList();
      storage.save(data);
    });
    //サンプルを入れてみる。
    //_memos.addAll(Memo.initialTodos);
  }

  @override
  void onClose() {
    worker.dispose();
    super.onClose();
  }

  List<Memo> get _memos => memos;

  void onTapAddMemo() {
    DateTime now = DateTime.now();
    DateFormat outputFormat = DateFormat('MM/dd');
    String date = outputFormat.format(now);

    final memo = Memo(
      appName: '',
      languageName: '',
      linkUrlName: '',
      designUrlName: '',
      memo: '',
      day: date,
    );
    memos.add(memo);
  }

  //TODO backキーを打ったら消せるようにする。
  void remove(Memo memo) {
    memos.remove(memo);
  }

  void deleteDone() {
    // memos.removeWhere((e) => e.id == true);
  }

  void onTap(int index, Memo memo) {
    selectedIndex.value = index;
    colors.value = Colors.amber;
  }

  // @override
  // void onInit() {
  //   super.onInit();
  //
  //   //textController.text == 'ああ';
  //
  //   print(index);
  //
  //   // // _todosに変化がある度にストレージに保存
  //   // controller.worker = ever<List<Memo>>(memos, (memos) {
  //   //   final data = memos.map((e) => e.toJson()).toList();
  //   //   //_storage.save(data);
  //   //   controller.storage.save(data);
  //   // });
  //
  // }

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

  void onChanged({
    required String word,
    required Memo memo,
    required int indexs,
  }) {
    //wordの値だけを更新させたい。
    //print(word);
    final index = memos.indexOf(memo);
    memo.appName == word;
    final newMemos = memo.copyWith(
      appName: word,
    );
    memos.setAll(index, [newMemos]);
  }

  void onChanged2({
    required String word,
    required Memo memo,
    required int indexs,
  }) {
    //wordの値だけを更新させたい。
    //print(word);
    final index = memos.indexOf(memo);
    memo.languageName == word;
    final newMemos = memo.copyWith(
      languageName: word,
    );
    memos.setAll(index, [newMemos]);
  }

  void onChanged3({
    required String word,
    required Memo memo,
    required int indexs,
  }) {
    //wordの値だけを更新させたい。
    //print(word);
    final index = memos.indexOf(memo);
    memo.designUrlName == word;
    final newMemos = memo.copyWith(
      designUrlName: word,
    );
    memos.setAll(index, [newMemos]);
  }

  void onChanged4({
    required String word,
    required Memo memo,
    required int indexs,
  }) {
    //wordの値だけを更新させたい。
    //print(word);
    final index = memos.indexOf(memo);
    memo.linkUrlName == word;
    final newMemos = memo.copyWith(
      linkUrlName: word,
    );
    memos.setAll(index, [newMemos]);
  }

  void onChanged5({
    required String word,
    required Memo memo,
    required int indexs,
  }) {
    //wordの値だけを更新させたい。
    //print(word);
    final index = memos.indexOf(memo);
    memo.memo == word;
    final newMemos = memo.copyWith(
      memo: word,
    );
    memos.setAll(index, [newMemos]);
  }
}
