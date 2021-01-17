import 'package:flutter/material.dart';
import 'package:flutter_stock/themes/styles.dart';

class MediaQueryScreen extends StatefulWidget {
  MediaQueryScreen({Key key}) : super(key: key);

  @override
  _MediaQueryScreenState createState() => _MediaQueryScreenState();
}

class _MediaQueryScreenState extends State<MediaQueryScreen> {
  @override
  Widget build(BuildContext context) {
    // ตัวอย่างการอ่านขนาด กว้าง x สูง
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double appbarHeight = 56.0;
    return Scaffold(
      // Status bar height 24
      // Default appbar height 56

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(appbarHeight),
        child: AppBar(
          title: Text('Media Query'),
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.green,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.4,
            child: Center(
              child: Text(
                'Screen : $screenSize',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
          Container(
            color: Colors.orange,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.2,
            child: Center(
              child: Text(
                'Screen Width : ${screenWidth.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
          Container(
            color: Colors.purple,
            width: MediaQuery.of(context).size.width,
            height:
                MediaQuery.of(context).size.height * 0.4 - appbarHeight - 47,
            child: Center(
              child: Text(
                'Screen Height : ${screenHeight.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
