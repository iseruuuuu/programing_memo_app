import 'package:flutter/material.dart';
import 'package:programming_note_app/component/list_item.dart';
import 'package:programming_note_app/component/memo_widget/memo_widget.dart';
import 'home_screen_controller.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeScreenController(), tag: '');
    final memos = controller.memos;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.drive_file_rename_outline,
            color: Colors.black,
          ),
          onPressed: controller.onTapAddMemo,
        ),
        actions: [
          IconButton(
            onPressed:() =>  controller.remove(memos[controller.selectedIndex.value]),
            icon: const Icon(
              Icons.delete,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Center(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Obx(
                () => ListView.builder(
                  controller: ScrollController(),
                  itemCount: memos.length,
                  itemBuilder: (BuildContext context, int index) {
                    final memoItem = memos[index];
                    return GestureDetector(
                      onTap: () => controller.onTap(index, memoItem),
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
            ),
            Expanded(
              flex: 3,
              child: Obx(
                () => MemoWidget(
                  memo: memos[controller.selectedIndex.value],
                  index: controller.selectedIndex.value,
                  onTap: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
