import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_keyboard_shortcuts/keyboard_shortcuts.dart';
import 'package:programming_note_app/component/list_item.dart';
import 'package:programming_note_app/component/list_tile.dart';
import 'package:programming_note_app/component/memo_widget/memo_widget.dart';
import '../../controller.dart';
import 'home_screen_controller.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Controller(), tag: '');
    final memos = controller.memos;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(
            Icons.drive_file_rename_outline,
            color: Colors.black,
          ),
          onPressed: controller.onTapAddMemo,
        ),
        actions: [
          IconButton(
            onPressed: () =>
                controller.remove(memos[controller.selectedIndex.value]),
            icon: const Icon(
              Icons.delete,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: KeyBoardShortcuts(
        keysToPress: {LogicalKeyboardKey.keyA},
        onKeysPressed: () {
          controller.onTapAddMemo();
        },
        child: Center(
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Obx(
                  () => controller.memos.isNotEmpty
                      ? ListView.builder(
                          controller: ScrollController(),
                          itemCount: memos.length,
                          itemExtent: 70,
                          itemBuilder: (BuildContext context, int index) {
                            final memoItem = memos[index];
                            return GestureDetector(
                              onTap: () {
                                controller.onTap(index, memoItem);
                              },
                              child: Obx(
                                () => ListTiles(
                                  index: index,
                                  indexs: 0,
                                  selectedIndex: controller.selectedIndex.value,
                                  memo: memoItem,
                                ),
                              ),
                            );
                          },
                        )
                      //TODO ??????????????????????????????????????????????????????
                      : Container(),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: VerticalDivider(
                  color: Colors.grey.shade300,
                  width: 1,
                ),
              ),
              Expanded(
                flex: 5,
                child: Obx(
                  () => controller.memos.isNotEmpty
                      ? MemoWidget(
                          memo: memos[controller.selectedIndex.value],
                          index: controller.selectedIndex.value,
                          onTap: () {},
                        )
                      //TODO ??????????????????????????????????????????????????????
                      : Container(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
