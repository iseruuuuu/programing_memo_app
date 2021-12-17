import 'package:flutter/material.dart';
import '../memo/memo.dart';

class ListTiles extends StatelessWidget {
  const ListTiles({
    Key? key,
    required this.index,
    required this.memo,
    required this.selectedIndex,
    required this.color,
    required this.select,
  }) : super(key: key);

  final int index;
  final Memo memo;
  final int selectedIndex;
  final Color color;
  final bool select;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.black12,
      //selected: select,
      selectedColor: Colors.amber,
      selectedTileColor: Colors.amber,
      leading: Column(
        children: [
          // Text(
          //   memo.day,
          //   overflow: TextOverflow.ellipsis,
          //   style: const TextStyle(
          //     fontSize: 15,
          //     color: Color(0xFF2E2817),
          //   ),
          // ),
          Text(
            (memo.appName == '') ? '新規メモ' : memo.appName,
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 18,
              color: Color(0xFF2E2817),
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            (memo.languageName == '') ? '' : memo.languageName,
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
//       child: Container(
//         decoration: BoxDecoration(
//           border: Border.all(
//             color: const Color(0xFFFFFFFF),
//             width: 2,
//           ),
//           color: color,
//           // color: (index == selectedIndex)
//           //     ? const Color(0xFFFFE080)
//           //     : const Color(0xFFFFFFFF),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(10),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 memo.day,
//                 overflow: TextOverflow.ellipsis,
//                 style: const TextStyle(
//                   fontSize: 15,
//                   color: Color(0xFF2E2817),
//                 ),
//               ),
//               Text(
//                 (memo.appName == '') ? '新規メモ' : memo.appName,
//                 textAlign: TextAlign.start,
//                 overflow: TextOverflow.ellipsis,
//                 style: const TextStyle(
//                   fontSize: 18,
//                   color: Color(0xFF2E2817),
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Text(
//                 (memo.languageName == '') ? '' : memo.languageName,
//                 textAlign: TextAlign.start,
//                 overflow: TextOverflow.ellipsis,
//                 style: const TextStyle(
//                   color: Colors.black,
//                   fontSize: 13,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

}