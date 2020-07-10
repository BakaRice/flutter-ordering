import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/screen/table.dart';
import 'package:provider/provider.dart';

import 'Staff.dart';
import 'login.dart';
import '../models/user.dart';

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

class IndexCard extends StatelessWidget {
  final String title;
  final String description;

  IndexCard(this.title, this.description);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(12, 12, 12, 0),
      child: Card(
          color: Colors.amber,
          elevation: 10,
          child: Container(
            padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(fontSize: 30),
                    ),
                    Text(title),
                    Text(title)
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.border_color),
                    Text(description)
                  ],
                )
              ],
            ),
          )),
    );
  }
}
