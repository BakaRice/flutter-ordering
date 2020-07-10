import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/screen/cart.dart';
import 'package:fooddeliveryapp/screen/check_out.dart';
import 'package:fooddeliveryapp/screen/login.dart';
import 'package:fooddeliveryapp/models/tableDetail.dart';
import 'package:fooddeliveryapp/screen/table.dart';
import 'package:provider/provider.dart';

import 'screen/Staff.dart';
import 'screen/Welcome.dart';
import 'models/table.dart';
import 'models/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // var cart = OrderCart;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserStatus(),
        ),
        ChangeNotifierProvider(
          create: (context) => TableStatusList(),
        ),
        ChangeNotifierProvider(
          create: (context) => TableDetail(),
        )
      ],
      child: MaterialApp(
        routes: {
          //登录页面
          LoginPage.routeName: (context) => LoginPage(),
          //登录后的首页
          WelcomePage.routeName: (context) => WelcomePage(),
          //订单页面
          // OrderPage.routeName: (context) => OrderPage(),
          //员工信息页面
          StaffInfoPage.routeName: (context) => StaffInfoPage(),
          //开台页面
          TablePage.routeName: (context) => TablePage(),
          //购物车页面
          OrderCart.routeName: (context) => OrderCart(),
          //结账页面
          CheckOut.routeName: (context) => CheckOut()
        },
        title: '点餐软件demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
      ),
    );
  }
}
