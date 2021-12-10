import 'package:flutter/material.dart';
import 'package:programming_note_app/component/list_item.dart';
import 'package:programming_note_app/component/memo_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return ListItem(
                    title: 'ああ',
                    day: '12/$index',
                    content: '楽しいメモだよおお',
                    index: index,
                  );
                },
              ),
            ),
            const Expanded(
              flex: 3,
              child: MemoWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
