import 'package:flutter/material.dart';
import 'package:programming_note_app/component/app_title.dart';
import 'package:get/get.dart';
import '../../memo/memo.dart';
import 'memo_widget_controller.dart';

class MemoWidget extends StatelessWidget {
  const MemoWidget({
    Key? key,
    required this.memo,
    required this.onTap,
    required this.index,
  }) : super(key: key);

  final Memo memo;
  final Function() onTap;
  final int index;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MemoWidgetController(index: index), tag: '');
    return SingleChildScrollView(
      controller: ScrollController(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: AppTitle(
              title: 'アプリ名',
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 30),
            child: TextField(
              controller: TextEditingController(text: memo.appName),
              //controller: controller.textController,
              //TODO 変更した時にリストとかも変わるようにする。
              onChanged: (text) => controller.onChanged(word: text, memo: memo, indexs: index),
              autofocus: true,
              maxLines: 1, // 行数に制限なし
              decoration: const InputDecoration(
                hintText: 'アプリ名を入力',
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: AppTitle(
              title: '開発言語',
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 30),
            child: TextField(
              controller: TextEditingController(text: memo.languageName),
              autofocus: true,
              maxLines: 1, // 行数に制限なし
              decoration: const InputDecoration(
                hintText: '開発言語を入力',
              ),
            ),
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 50, left: 25),
                child: AppTitle(
                  title: 'デザインURL',
                ),
              ),
              ElevatedButton(
                onPressed: () => controller.onTapLink(memo.designUrlName),
                child: const Text('リンク'),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 30),
            child: TextField(
              controller: TextEditingController(text: memo.designUrlName),
              autofocus: true,
              maxLines: 1, // 行数に制限なし
              decoration: const InputDecoration(
                hintText: 'デザインURL入力',
              ),
            ),
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 50, left: 25),
                child: AppTitle(
                  title: '参考にしたサイト',
                ),
              ),
              ElevatedButton(
                onPressed: () => controller.onTapLink(memo.linkUrlName),
                child: const Text('リンク'),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 30),
            child: TextField(
              controller: TextEditingController(text: memo.linkUrlName),
              autofocus: true,
              maxLines: 1,
              decoration: const InputDecoration(
                hintText: 'URL入力',
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: AppTitle(
              title: 'メモ',
            ),
          ),
          //TODO MarkDownにしておきたい!!
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: double.infinity,
              height: 500,
              color: Colors.black12,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: TextEditingController(text: memo.memo),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
