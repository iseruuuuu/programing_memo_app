import 'package:flutter/material.dart';
import 'package:programming_note_app/component/list_item.dart';
import 'package:programming_note_app/component/memo_widget.dart';
import '../../memo/memo.dart';
import 'home_screen_controller.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key key,
    this.memo,
  }) : super(key: key);

  final Memo memo;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeScreenController(), tag: '');
    final memos = controller.memos;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 20,
        leading: IconButton(
          icon: const Icon(
            Icons.drive_file_rename_outline,
            color: Colors.black,
          ),
          //TODO メモを追加できるようにしたい。
          onPressed: controller.onTapAddMemo,
        ),
      ),
      body: Center(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: ListView.builder(
                itemCount: memos.length,
                itemBuilder: (BuildContext context, int index) {
                  final memoItem = memos[index];
                  return GestureDetector(
                    onTap: () => controller.onTap(index),
                    child: ListItem(
                      //TODO 押したもののみ色を変えたい。
                      index: controller.selectedIndex.value,
                      selectedIndex: controller.selectedIndex.value,
                      memo: memoItem,
                    ),
                  );
                },
              ),
            ),
            Expanded(
              flex: 3,
              child: Obx(
                () => MemoWidget(
                  memo: memos[controller.selectedIndex.value],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
