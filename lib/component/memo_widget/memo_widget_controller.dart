import '../../memo/memo.dart';
import 'package:get/get.dart';

class MemoWidgetController extends GetxController {
  final memos = <Memo>[].obs;
  final selectedIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void onTapLink(String url) async {
    //TODO 記入後の状態変化ができていない。
    print(url);

    //if (!await launch(url)) throw 'Could not launch $url';
  }
}
