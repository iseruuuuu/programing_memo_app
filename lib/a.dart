import 'package:flutter/material.dart';

class Home12 extends StatelessWidget {
  const Home12({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: ListView(
              children: const [
                Text('Item 1'),
                Text('Item 2'),
                Text('Item 3'),
              ],
            ),
          ),
          //わかりやすく線を引いてみました。
          SizedBox(
              height: MediaQuery.of(context).size.height,
              child: const VerticalDivider(
                color: Colors.black,
                thickness: 5,
              )
          ),
          Expanded(
            flex: 2,
            child: ListView(
              children: const [
                Text('Item 4'),
                Text('Item 5'),
                Text('Item 6'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
