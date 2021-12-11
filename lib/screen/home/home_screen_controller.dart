import 'dart:convert';

import 'package:programming_note_app/preference/preference.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../memo/memo.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeScreenController extends GetxController {
  final memos = <Memo>[].obs;
  final selectedIndex = 0.obs;

  final preference = Preference();
  var memo = <Memo>[].obs;

  @override
  void onInit() {
    super.onInit();


    //final storageMemo = preference.load(PreferenceKey.memomemo).map((json) => Memo.fromJson(json))?.toList();
    //final initialTodos = storageMemo ?? Memo.initialTodos;

    final storageMemo = preference.load(PreferenceKey.memomemo);

    //memo = storageMemo.map;

    memos.addAll(Memo.initialTodos);
  }

  @override
  void onClose() {

    super.onClose();
  }

  List<Memo> get _memos => memos;

  Memo getTodoById(String id) {
    try {
      return memos.singleWhere((e) => e.id == id);
    } on StateError {
      return null; // 該当IDがなければnullを返す
    }
  }

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
