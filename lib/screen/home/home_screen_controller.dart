import 'dart:convert';

import 'package:programming_note_app/preference/preference.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../memo/memo.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../preference/storage_service/storeage_service.dart';

class HomeScreenController extends GetxController {
  final selectedIndex = 0.obs;

  final memos = <Memo>[].obs;
  final _storage = TodoStorage();
  late final Worker _worker;

  @override
  void onInit() {
    super.onInit();
    final storageTodos =
        _storage.load()?.map((json) => Memo.fromJson(json)).toList();
    // SharedPreferencesにデータがなければダミー初期データをロード
    final initialTodos = storageTodos ?? Memo.initialTodos;
    _memos.addAll(initialTodos);

    // _todosに変化がある度にストレージに保存
    _worker = ever<List<Memo>>(memos, (todos) {
      final data = todos.map((e) => e.toJson()).toList();
      _storage.save(data);
    });
  }

  @override
  void onClose() {
    _worker.dispose();
    super.onClose();
  }

  List<Memo> get _memos => memos;

  void onTapAddMemo() {
    DateTime now = DateTime.now();
    DateFormat outputFormat = DateFormat('MM/dd');
    String date = outputFormat.format(now);

    final todo = Memo(
      appName: '',
      languageName: '',
      linkUrlName: ' ',
      designUrlName: ' ',
      memo: '',
      day: date,
    );
    memos.add(todo);
  }

  //TODO backキーを打ったら消せるようにする。
  void remove(Memo memo) {
    memos.remove(memo);
  }

  void onTap(int index) {
    selectedIndex.value = index;
  }
}
