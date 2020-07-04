import 'package:flutter/material.dart';

///Order START
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

class OrderPage extends StatefulWidget {
  static const routeName = '/order';

  @override
  State<StatefulWidget> createState() {
    return _OrderPageState();
  }
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
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
