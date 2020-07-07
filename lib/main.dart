import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/login.dart';
import 'package:fooddeliveryapp/table.dart';
import 'package:provider/provider.dart';

import 'Staff.dart';
import 'Welcome.dart';
import 'models/table.dart';
import 'models/user.dart';
import 'order/order.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserStatus(),
        ),
        ChangeNotifierProvider(
          create: (context) => TableStatusList(),
        )
      ],
      child: MaterialApp(
        routes: {
          //登录页面
          LoginPage.routeName: (context) => LoginPage(),
          //登录后的首页
          WelcomePage.routeName: (context) => WelcomePage(),
          //订单页面
          OrderPage.routeName: (context) => OrderPage(),
          //员工信息页面
          StaffInfoPage.routeName: (context) => StaffInfoPage(),
          //开台页面
          TablePage.routeName: (context) => TablePage()
        },
        title: '点餐软件demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
      ),
    );
  }
}
