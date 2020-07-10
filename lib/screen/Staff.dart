import 'package:flutter/material.dart';

///STAFF START
class StaffInfoPage extends StatefulWidget {
  static const routeName = '/staff';

  @override
  State<StatefulWidget> createState() => _StaffInfoState();
}

class _StaffInfoState extends State<StaffInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("员工信息"),
      ),
      body: Card(
        child: Row(
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "员工号:" + 8.toString(),
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("员工姓名:" + "谭武略"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("本次上岗时间:" +
                      DateTime.now().toIso8601String().split("T")[0] +
                      " " +
                      DateTime.now().toIso8601String().split("T")[1]),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

/// STAFF END
