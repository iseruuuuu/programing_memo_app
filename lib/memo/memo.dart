import 'package:flutter/cupertino.dart';

@immutable
class Memo {
  final String id;
  final String appName;
  final String languageName;
  final String designUrlName;
  final String linkUrlName;
  final String memo;
  final String day;

  Memo({
    this.appName,
    this.languageName,
    this.designUrlName,
    this.linkUrlName,
    this.memo,
    this.day,
  }) : id = DateTime.now().millisecondsSinceEpoch.toString();

  const Memo.withId({
    this.id,
    this.appName,
    this.languageName,
    this.designUrlName,
    this.linkUrlName,
    this.memo,
    this.day,
  });

  static const initialTodos = [
    Memo.withId(
      id: '0',
      appName: 'アプリメモ',
      languageName: '開発言語',
      designUrlName: 'デザインURL',
      linkUrlName: 'リンクURL',
      memo: 'メモ',
      day: '11/11',
    ),
    Memo.withId(
      id: '1',
      appName: '1',
      languageName: '1',
      designUrlName: '1',
      linkUrlName: '1',
      memo: '1',
      day: '22/22',
    ),
    Memo.withId(
      id: '2',
      appName: '2',
      languageName: '2',
      designUrlName: '2',
      linkUrlName: '2',
      memo: '2',
      day: '33/33'
    ),
  ];
}
