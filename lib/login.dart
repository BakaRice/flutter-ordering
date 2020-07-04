import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import 'Welcome.dart';
import 'models/user.dart';

class LoginPage extends StatefulWidget {
  static const routeName = "/";

  @override
  _LoginPageState createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _pwdEditController;
  TextEditingController _userNameEditController;

  final FocusNode _userNameFocusNode = FocusNode();
  final FocusNode _pwdFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _pwdEditController = TextEditingController();
    _userNameEditController = TextEditingController();

    _pwdEditController.addListener(() => setState(() => {}));
    _userNameEditController.addListener(() => setState(() => {}));
  }

  @override
  Widget build(BuildContext context) {
    final loginStatus = Provider.of<UserStatus>(context);
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.settings),
        title: Text("STAFF LOGIN"),
        backgroundColor: Colors.amber,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            buildTopWidget(context),
            SizedBox(
              height: 80,
            ),
            buildEditWidget(context),
            buildLoginButton(loginStatus)
          ],
        ),
      ),
    );
  }

  /// 头部
  Widget buildTopWidget(BuildContext context) {
    double height = 200.0;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: height,
      color: Colors.amber,
      child: Stack(
        overflow: Overflow.visible, // 超出部分显示
        children: <Widget>[
          Positioned(
            left: (width - 90) / 2.0,
            top: height - 45,
            child: Container(
              width: 90.0,
              height: 90.0,
              decoration: BoxDecoration(
                ///阴影
                boxShadow: [
                  BoxShadow(color: Theme.of(context).cardColor, blurRadius: 4.0)
                ],

                ///形状
                shape: BoxShape.circle,

                ///图片
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                     'https://picsum.photos/id/1/150'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildEditWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: <Widget>[
          buildLoginNameTextField(),
          SizedBox(height: 20.0),
          buildPwdTextField(),
        ],
      ),
    );
  }

  Widget buildLoginNameTextField() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 16,
            top: 11,
            width: 18,
            height: 18,
            child: Icon(Icons.supervised_user_circle),
          ),
          Positioned(
            left: 45,
            top: 10,
            bottom: 10,
            width: 1,
            child: Container(
              color: Colors.black,
            ),
          ),
          Positioned(
            left: 55,
            right: 10,
            top: 10,
            height: 30,
            child: TextField(
              controller: _userNameEditController,
              focusNode: _userNameFocusNode,
              decoration: InputDecoration(
                hintText: "请输入用户名",
                border: InputBorder.none,
              ),
              style: TextStyle(fontSize: 14),
            ),
          )
        ],
      ),
    );
  }

  Widget buildPwdTextField() {
    return Container(
        height: 40,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              left: 16,
              top: 11,
              width: 18,
              height: 18,
              child: Icon(Icons.security),
            ),
            Positioned(
              left: 45,
              top: 10,
              bottom: 10,
              width: 1,
              child: Container(
                color: Colors.black,
              ),
            ),
            Positioned(
              left: 55,
              right: 10,
              top: 10,
              height: 30,
              child: TextField(
                controller: _pwdEditController,
                focusNode: _pwdFocusNode,
                decoration: InputDecoration(
                  hintText: "请输入密码",
                  border: InputBorder.none,
                ),
                style: TextStyle(fontSize: 14),
                obscureText: true,

                /// 设置密码
              ),
            )
          ],
        ));
  }

  Widget buildLoginButton(UserStatus loginStatus) {
    return Container(
      margin: EdgeInsets.only(top: 40, left: 10, right: 10),
      padding: EdgeInsets.all(0),
      width: MediaQuery.of(context).size.width - 20,
      height: 40,
      child: RaisedButton(
        onPressed: () {
          print("【LoginPage】尝试登陆...");
          if (checkInput()) {
            Fluttertoast.showToast(
                msg: "登录成功",
                gravity: ToastGravity.CENTER,
                timeInSecForIos: 2,
                textColor: Colors.white,
                fontSize: 14.0);
            loginStatus.value = true;
//            print("loginStatus" + loginStatus.value);
//            Navigator.popAndPushNamed(context, OrderPage.routeName);
            print("【LoginPage】登陆完成，即将进行路由跳转...");
            Navigator.popAndPushNamed(context, WelcomePage.routeName);
          } else {
            Fluttertoast.showToast(
                msg: "账号或密码错误",
                gravity: ToastGravity.CENTER,
                timeInSecForIos: 2,
                textColor: Colors.white,
                fontSize: 14.0);
          }
        },
        child: Text("登录"),
        color: Colors.amber,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
      ),
    );
  }

  bool checkInput() {
    if (_userNameEditController.text.length == 0) {
      Fluttertoast.showToast(
          msg: "请输入用户名",
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 2,
          textColor: Colors.white,
          fontSize: 14.0);

      return false;
    } else if (_pwdEditController.text.length == 0) {
      Fluttertoast.showToast(
          msg: "请输入密码",
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 2,
          textColor: Colors.white,
          fontSize: 14.0);
      return false;
    }

    return _userNameEditController.text == '1001' &&
        _pwdEditController.text == '1001';
  }
}

