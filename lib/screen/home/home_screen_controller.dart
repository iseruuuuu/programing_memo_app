import '../../memo/memo.dart';
import '../add/add_screen.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  final memos = <Memo>[].obs;

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

  // 指定タスクを削除
  void remove(Memo memo) {
    memos.remove(memo); // 等価性overrideしたのでOK
  }

  // // 完了タスクを一括削除
  // void deleteDone() {
  //   memos.removeWhere((e) => e.done == true);
  // }

  // void onTap() {
  //   Get.to(() => const AddScreen());
  // }
}
