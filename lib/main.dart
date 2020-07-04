import 'package:flutter/material.dart';
//import 'package:fooddeliveryapp/order.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        WelcomePage.routeName: (context) {
          return WelcomePage();
        },
        OrderPage.routeName: (context) => OrderPage(),
        StaffInfoPage.routeName: (context) => StaffInfoPage()
      },
      title: '点餐软件demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
      ),
//      home: MyHomePage(title: '点餐软件首页'),
    );
  }
}

class WelcomePage extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("点餐软件首页"),
      ),
      body: Column(
        children: <Widget>[
          GestureDetector(
            child: IndexCard("开台", "开始自主点餐，并进行结算"),
            onTap: () => Navigator.pushNamed(context, OrderPage.routeName),
          ),
          GestureDetector(
            child: IndexCard("STAFF", "设备员工信息"),
            onTap: () => Navigator.pushNamed(context, StaffInfoPage.routeName),
          )
        ],
      ),
    );
  }
}

///Order START
class IndexCard extends StatelessWidget {
  var title;
  var description;

  IndexCard(this.title, this.description);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.fromLTRB(12, 12, 12, 0),
      child: Card(
//          shape: RoundedRectangleBorder(
//            borderRadius: BorderRadius.circular(15.0),
//          ),
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

class OrderPage extends StatefulWidget {
  static const routeName = '/order';

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _OrderPageState();
  }
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("点单页面")),
      body: Center(
        child: Column(
          children: <Widget>[Text("order页面")],
        ),
      ),
    );
  }
}

/// order END

///STAFF START
class StaffInfoPage extends StatefulWidget {
  static const routeName = '/staff';

  @override
  State<StatefulWidget> createState() => _staffInfoState();
}

class _staffInfoState extends State<StaffInfoPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("员工信息"),
      ),
      body: Container(
        child: Center(
          child: Text("STAFF INFORMATION"),
        ),
      ),
    );
  }
}

/// STAFF END
