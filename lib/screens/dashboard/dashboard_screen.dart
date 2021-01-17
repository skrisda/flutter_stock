import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_stock/screens/bottomnav/account/account_screen.dart';
import 'package:flutter_stock/screens/bottomnav/home/home_screen.dart';
import 'package:flutter_stock/screens/bottomnav/notification/notification_screen.dart';
import 'package:flutter_stock/screens/bottomnav/setting/setting_screen.dart';
import 'package:flutter_stock/screens/bottomnav/stock/stock_screen.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // สร้างตัวเก็บข้อมูลแบบ SharedPreferences
  SharedPreferences sharedPreferences;

  //สร้างตัวแปรไว้เก็บ ชื่อและอีเมล
  String nameAccount, emailAccount;

  //สร้างตัวแปร List เก็บรายการหน้าที่ต้องการเปลี่ยนแปลง Bottom navigationbar
  int _currentIndex = 0;
  String _title;

  final List<Widget> _children = [
    HomeScreen(),
    StockScreen(),
    NotificationScreen(),
    SettingScreen(),
    AccountScreen()
  ];

  @override
  void initState() {
    super.initState();
    _title = 'หน้าหลัก';

    //ตรวจข้อมูล SharedPreferences ของผู้ใช้
    checkLoginStatus();
  }

  // Check login status
  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();

    if (sharedPreferences.getString("storeEmail") == null) {
      //ส่งกลับหน้า Login
      Navigator.pushNamed(context, '/login');
    }
    setState(() {
      nameAccount = sharedPreferences.getString('storeName');
      emailAccount = sharedPreferences.getString('storeEmail');
    });
  }

  //สร้าง Method สำหรับการเปลี่ยนหน้า
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      switch (index) {
        case 0:
          _title = 'หน้าหลัก';
          break;
        case 1:
          _title = 'สต๊อกสินค้า';
          break;
        case 2:
          _title = 'แจ้งเตือน';
          break;
        case 3:
          _title = 'ตั้งค่า';
          break;
        case 4:
          _title = 'ฉัน';
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _title,
          style: GoogleFonts.kanit(),
        ),
        actions: [
          FlatButton(
              onPressed: () {
                sharedPreferences.clear();
                Navigator.pushNamed(context, '/login');
              },
              child: Text(
                'ออกจากระบบ',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      drawer: SafeArea(
          child: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: GestureDetector(
                onTap: () {},
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://sc.sci.tsu.ac.th/krisda/images/KDS_2925.jpg'),
                ),
              ),
              otherAccountsPictures: [
                GestureDetector(
                  onTap: () {},
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://sc.sci.tsu.ac.th/krisda/images/zetong-li-7pUHeP1GRC4-unsplash.jpg'),
                  ),
                )
              ],
              accountName: Text('$nameAccount'),
              accountEmail: Text('$emailAccount'),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://sc.sci.tsu.ac.th/krisda/images/fabrice-villard-7__6lSyuYeA-unsplash.jpg'),
                      fit: BoxFit.fill)),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('เกี่ยวกับเรา'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/about');
              },
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text('ข้อมูลการใช้งาน'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/term');
              },
            ),
            ListTile(
              leading: Icon(Icons.mail),
              title: Text('ติดต่อเรา'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/contact');
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('ออกจากระบบ'),
              onTap: () {
                sharedPreferences.clear();
                Navigator.pushNamed(context, '/login');
              },
            ),
            Divider(
              color: Colors.green[200],
            ),
            ListTile(
              leading: Icon(Icons.cancel),
              title: Text('ปิดเมนู'),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      )),
      body: _children[_currentIndex],

      // Bottom Navigation bar
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home), title: Text('หน้าหลัก')),
          BottomNavigationBarItem(
              icon: Icon(Icons.storage), title: Text('สต๊อก')),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), title: Text('แจ้งเตือน')),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), title: Text('ตั้งค่า')),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('ฉัน')),
        ],
      ),
    );
  }
}
