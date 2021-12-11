import 'dart:convert';

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
    required this.appName,
    required this.languageName,
    required this.designUrlName,
    required this.linkUrlName,
    required this.memo,
    required this.day,
  }) : id = DateTime.now().millisecondsSinceEpoch.toString();

  const Memo.withId({
    required this.id,
    required this.appName,
    required this.languageName,
    required this.designUrlName,
    required this.linkUrlName,
    required this.memo,
    required this.day,
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
        day: '33/33'),
  ];

  Memo copyWith({
    required String id,
    required String appName,
    required String languageName,
    required String designUrlName,
    required String linkUrlName,
    required String memo,
    required String day,
  }) {
    return Memo.withId(
      // id: id ?? this.id,
      // appName: appName ?? this.appName,
      // languageName: languageName ?? this.languageName,
      // designUrlName: designUrlName ?? this.designUrlName,
      // linkUrlName: linkUrlName ?? this.linkUrlName,
      // memo: memo ?? this.memo,
      // day: day ?? this.day,

      id: id,
      appName: appName,
      languageName: languageName,
      designUrlName: designUrlName,
      linkUrlName: linkUrlName,
      memo: memo,
      day: day,
    );
  }

  String toJson() {
    return jsonEncode({
      'id': id,
      '1': appName,
      '2': languageName,
      '3': designUrlName,
      '4': linkUrlName,
      '5': memo,
      '6': day,
    });
  }

  factory Memo.fromJson(String json) {
    final mapData = jsonDecode(json);
    return Memo.withId(
      id: mapData['id'] as String,
      appName: mapData['1'] as String,
      languageName: mapData['2'] as String,
      designUrlName: mapData['3'] as String,
      linkUrlName: mapData['4'] as String,
      memo: mapData['5'] as String,
      day: mapData['6'] as String,
    );
  }
}
