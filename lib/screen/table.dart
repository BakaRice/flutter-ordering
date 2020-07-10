import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/models/tableDetail.dart';
import 'package:fooddeliveryapp/screen/order/order_home_screen.dart';
import 'package:provider/provider.dart';

import '../models/table.dart';

class TablePage extends StatefulWidget {
  static const String routeName = '/table';

  @override
  State<StatefulWidget> createState() {
    return _TableState();
  }
}

class _TableState extends State<TablePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TableStatusList>(
        builder: (context, tableStatusList, child) {
      return Scaffold(
          body: NestedScrollView(
        headerSliverBuilder: (context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              primary: true,
              expandedHeight: 200,
              pinned: true,
              floating: true,
              snap: false,
              flexibleSpace: _getFlexBar(tableStatusList),
            )
          ];
        },
        body: _getTableItems(tableStatusList, context),
      ));
    });
  }

  _getFlexBar(TableStatusList tableStatusList) {
    return FlexibleSpaceBar(
      title: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('目前开台数:' + tableStatusList.size().toString(),
              style: TextStyle(fontSize: 12)),
          Text(
            '剩余空位:' + (30 - tableStatusList.size()).toString(),
            style: TextStyle(fontSize: 10),
          ),
        ],
      ),
      background: Image.network(
        'https://picsum.photos/200/300/?blur',
        fit: BoxFit.fill,
      ),
    );
  }

  _getTableItems(TableStatusList tableStatusList, BuildContext context) {
    return GridView.extent(
        maxCrossAxisExtent: 150,
        padding: EdgeInsets.all(4),
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: _buildGridTileList(30, tableStatusList, context));
  }

/*
* 单写了一个私有方法，创建指定数量的组件
* */
  List<Widget> _buildGridTileList(
      int count, TableStatusList tableStatusList, BuildContext context) {
    List<Widget> containers = [];
    final statusList = Provider.of<TableStatusList>(context);
    final myTableDetail = Provider.of<TableDetail>(context);

    for (var i = 0; i < count; i++) {
      // var image = Image.network('https://picsum.photos/id/$i/150');
      // containers.add(image);
      containers.add(GestureDetector(
        child: _tableCell(tableStatusList, i),
        onTap: () {
          if (tableStatusList.isopen(i)) {
            print("点击该台已开台，台号为=> " + "$i");
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => HomeSrcreen(index: i)));
          } else {
            print("点击该台号为=> " + "$i");
            statusList.addtable(TableStatus(i));
            myTableDetail.setTableId(i);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => HomeSrcreen(index: i)));
          }
        },
      ));
    }
    return containers;
  }

  _tableCell(TableStatusList tableStatusList, int index) {
    if (tableStatusList.isopen(index)) {
      return Container(
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.green,
          ),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(
                    Icons.warning,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  Text(
                    index.toString(),
                    style: TextStyle(fontSize: 15),
                  )
                ],
              ),
              Icon(Icons.table_chart),
              Text("已开台"),
            ],
          ));
    } else {
      return Container(
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.blue,
          ),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(
                    Icons.audiotrack,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  Text(
                    index.toString(),
                    style: TextStyle(fontSize: 15),
                  )
                ],
              ),
              Icon(
                Icons.table_chart,
                color: Colors.white,
              ),
              Text("空桌"),
            ],
          ));
    }
  }
}
