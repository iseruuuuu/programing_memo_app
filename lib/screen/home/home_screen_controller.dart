import 'package:flutter/material.dart';

import '../../memo/memo.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../preference/storage_service/storeage_service.dart';

class HomeScreenController extends GetxController {
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
    _memos.addAll(Memo.initialTodos);
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
    print(index);
    selectedIndex.value = index;
    print(selectedIndex);
    colors.value = Colors.amber;

    print(colors.value);
  }
}
