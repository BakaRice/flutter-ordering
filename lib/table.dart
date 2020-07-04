import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/table.dart';

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
        body: _getTableItems(tableStatusList),
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
            '剩余空位:'+(30-tableStatusList.size()).toString(),
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

  _getTableItems(tableStatusList) {
    return GridView.extent(
        maxCrossAxisExtent: 150,
        padding: EdgeInsets.all(4),
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: _buildGridTileList(30, tableStatusList));
  }

/*
* 单写了一个私有方法，创建指定数量的组件
* */
  List<Widget> _buildGridTileList(int count, TableStatusList tableStatusList) {
    List<Widget> containers = [];
    for (var i = 0; i < count; i++) {
      // var image = Image.network('https://picsum.photos/id/$i/150');
      // containers.add(image);
      containers.add(GestureDetector(
        child: Text(tableStatusList.isopen(i).toString() + "$i"),
        onTap: () {
          if (tableStatusList.isopen(i)) {
            //进行开台
            print("$i");
          } else {
            print("该桌未开台=> " + "$i");
          }
        },
      ));
    }
    return containers;
  }
}
