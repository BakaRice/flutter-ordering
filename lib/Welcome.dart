import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/table.dart';
import 'package:provider/provider.dart';

import 'Staff.dart';
import 'login.dart';
import 'models/user.dart';
import 'order.dart';

class WelcomePage extends StatelessWidget {
  static const routeName = '/welcome';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("点餐软件首页"),
      ),
      body: Consumer<UserStatus>(builder: (context, userStatus, child) {
        return Column(
          children: <Widget>[
            GestureDetector(
              child: IndexCard("OPEN", "开始自主点餐，并进行结算"),
              onTap: () {
                if (userStatus.value)
                  Navigator.pushNamed(context, TablePage.routeName);
                else
                  Navigator.pushNamed(context, LoginPage.routeName);
              },
            ),
            GestureDetector(
                child: IndexCard("STAFF", "设备员工信息"),
                onTap: () {
                  if (userStatus.value)
                    Navigator.pushNamed(context, StaffInfoPage.routeName);
                  else
                    Navigator.pushNamed(context, LoginPage.routeName);
                })
          ],
        );
      }),
    );
  }
}
