import '../../memo/memo.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeScreenController extends GetxController {
  final memos = <Memo>[].obs;
  final selectedIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();

    memos.addAll(Memo.initialTodos);
  }

  List<Memo> get todos => memos; // TODO:フィルタの状態によって返すTodoを変える

  // IDからTodoを取得
  Memo getTodoById(String id) {
    try {
      return memos.singleWhere((e) => e.id == id);
    } on StateError {
      return null; // 該当IDがなければnullを返す
    }
  }

  // Todo新規作成
  void addTodo(String description) {
    final todo = Memo(appName: 'あああ');
    memos.add(todo);
  }

  void onTapAddMemo() {
    DateTime now = DateTime.now();
    DateFormat outputFormat = DateFormat('MM/dd');
    String date = outputFormat.format(now);

    final todo = Memo(
      appName: 'アプリメモ',
      languageName: '',
      linkUrlName: ' ',
      designUrlName: ' ',
      memo: '',
      day: date,
    );
    memos.add(todo);
  }

  // 指定タスクを削除
  void remove(Memo memo) {
    memos.remove(memo); // 等価性overrideしたのでOK
  }

  void onTap(int index) {
    selectedIndex.value = index;
  }
}
