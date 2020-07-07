import 'package:flutter/material.dart';

///Order START
class OrderPage extends StatefulWidget {
  static const routeName = '/order';
  final int index;
  //构造函数 同时传入桌号
  OrderPage({Key key, @required this.index}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    print("[桌点餐详情]" + index.toString());
    return _OrderPageState();
  }
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("点单页面")),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,60,0,0),
                    child: Text(
                      "口之福火锅店",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.red,
                image: new DecorationImage(
                  // image: new ExactAssetImage('images/drawer.jpg'),
                  image: new NetworkImage(
                      "http://test.ricemarch.com:9000/images/timg.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[Text("order页面")],
        ),
      ),
    );
  }
}

/// order END
