// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
// import '../../memo/memo.dart';
// import 'package:get/get.dart';
// import '../../preference/storage_service/storeage_service.dart';
// import '../../screen/home/home_screen_controller.dart';
//
// class MemoWidgetController extends GetxController {
//   final memos = <Memo>[].obs;
//   final textController = TextEditingController();
//   final int index;
//   final controller = Get.put(HomeScreenController());
//
//
//   MemoWidgetController({
//     required this.index,
//   });
//
//   @override
//   void onInit() {
//     super.onInit();
//
//     //textController.text == 'ああ';
//
//     print(index);
//
//     // // _todosに変化がある度にストレージに保存
//     // controller.worker = ever<List<Memo>>(memos, (memos) {
//     //   final data = memos.map((e) => e.toJson()).toList();
//     //   //_storage.save(data);
//     //   controller.storage.save(data);
//     // });
//
//   }
//
//   void onTapLink(String url) async {
//     //TODO 記入後の状態変化ができていない。
//     if (url != '') {
//       await launch(url);
//     } else {
//       Get.snackbar(
//         "リンクが開けませんでした",
//         "正しいURLを入力してください!!",
//         snackPosition: SnackPosition.TOP,
//         backgroundColor: Colors.white,
//       );
//     }
//   }
//
//   void onChanged(
//       {required String word, required Memo memo, required int indexs}) {
//     //wordの値だけを更新させたい。
//     //print(word);
//
//     final index = memos.indexOf(memo);
//     print(index);
//     memo.appName == word;
//
//     // final newMemo = memo.copyWith(
//     //   id: memo.id,
//     //   appName: word,
//     //   languageName: memo.languageName,
//     //   designUrlName: memo.designUrlName,
//     //   linkUrlName: memo.linkUrlName,
//     //   memo: memo.memo,
//     //   day: memo.day,
//     // );
//     final newMemos = memo.copyWith(
//       appName: word,
//     );
//     //memos.setAll(index,[newMemos]);
//
//
//
//     // controller.worker = ever<List<Memo>>(memos, (memos) {
//     //   final data = memos.map((e) => e.toJson()).toList();
//     //   //_storage.save(data);
//     //   controller.storage.save(data);
//     // });
//
//     // void updateText(String description, Todo todo) {
//     //   final index = _todos.indexOf(todo);
//     //   final newTodo = todo.copyWith(description: description);
//     //   _todos.setAll(index, [newTodo]);
//     // }
//
//     // memos.add(newMemo);
//
//     // final memo2 = Memo(
//     //   appName: '1',
//     //   languageName: '2',
//     //   linkUrlName: '4 ',
//     //   designUrlName: '5 ',
//     //   memo: '66',
//     //   day: memo.day,
//     // );
//     // memos.add(memo2);
//     //
//     // print(indexs);
//
//     //memos[index].appName == word;
//
//     //print(newMemo.appName);
//     //print(memos[index].appName);
//     //print(index);
//
//     //memos.setAll(index, [newMemo]);
//   }
// }
