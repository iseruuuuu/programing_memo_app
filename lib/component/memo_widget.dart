import 'package:flutter/material.dart';
import 'package:programming_note_app/component/app_title.dart';

class MemoWidget extends StatelessWidget {
  const MemoWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const AppTitle(
            title: 'アプリ名',
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 3, horizontal: 30),
            child: TextField(),
          ),
          const AppTitle(
            title: '開発言語',
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 3, horizontal: 30),
            child: TextField(),
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
                onPressed: () {},
                child: const Text('リンク'),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 3, horizontal: 30),
            child: TextField(),
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
                onPressed: () {},
                child: const Text('リンク'),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 3, horizontal: 30),
            child: TextField(),
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
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
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
