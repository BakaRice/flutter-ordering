import 'dart:collection';

import 'package:flutter/material.dart';

//所有桌状态
class TableStatusList with ChangeNotifier {
  Map<int, TableStatus> _tableStatusMap = HashMap();

  get tableMap => _tableStatusMap;

  int size() => _tableStatusMap.length;

  ///如果当前台已开返回true，如果没开则返回false
  bool isopen(int index) {
    return _tableStatusMap.containsKey(index);
  }

  addtable(TableStatus tableStatus) {
    _tableStatusMap[tableStatus.id] = tableStatus;
    notifyListeners();
  }

  deletetable(int index) {
    print("[删除桌号]" + index.toString());
    _tableStatusMap.remove(index);
    notifyListeners();
  }

  changetable(int before, TableStatus tableStatus) {
    if (!isopen(tableStatus.id)) {
      print("[更换桌号]" + before.toString());
      deletetable(before);
      addtable(tableStatus);
    }
  }
}

//桌状态
class TableStatus {
  TableStatus(this.id);

  int id;

  bool isopen = false;
}

// class OrderDetails {}
