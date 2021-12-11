import 'package:flutter/material.dart';
import 'package:programming_note_app/component/app_title.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';

import '../../memo/memo.dart';
import 'memo_widget_controller.dart';

class MemoWidget extends StatelessWidget {
  const MemoWidget({
    Key key,
    this.memo,
    this.controller,
    this.onTap,
  }) : super(key: key);

  final Memo memo;
  final TextEditingController controller;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MemoWidgetController(), tag: '');
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const AppTitle(
            title: 'アプリ名',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 30),
            child: TextField(
              controller: TextEditingController(text: memo.appName),
              onChanged: (text) {
                //TODO 変更した時にリストとかも変わるようにする。
                memo.appName == text;
                print(text);
              },
            ),
          ),
          const AppTitle(
            title: '開発言語',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 30),
            child: TextField(
              controller: TextEditingController(text: memo.languageName),
            ),
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 50),
                child: AppTitle(
                  title: 'デザインURL',
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
              controller: TextEditingController(text: memo.designUrlName),
            ),
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 50),
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
            ),
          ),
          const AppTitle(
            title: 'メモ',
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: double.infinity,
              height: 500,
              color: Colors.blueGrey,
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
