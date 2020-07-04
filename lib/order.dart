import 'package:flutter/material.dart';

//main() => runApp(OrderPage());

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
