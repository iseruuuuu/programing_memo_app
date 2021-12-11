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

  List<Memo> get todos => memos;

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
