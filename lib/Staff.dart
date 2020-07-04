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
      body: Container(
        child: Center(
          child: Text("STAFF INFORMATION"),
        ),
      ),
    );
  }
}

/// STAFF END
