import 'dart:collection';

import 'package:flutter/material.dart';

//所有桌状态
class TableStatusList with ChangeNotifier {
  Map<int, TableStatus> _tableStatusMap = HashMap();

  get tableMap => _tableStatusMap;

  int size() => _tableStatusMap.length;

  bool isopen(int index) {
    if (_tableStatusMap != null && _tableStatusMap[index] != null)
      return _tableStatusMap[index].isopen;
    else
      return false;
  }

  addtable(TableStatus tableStatus) {
    _tableStatusMap[tableStatus.id] = tableStatus;
  }

  deletetable(int index) {
    _tableStatusMap.remove(index);
  }
}

//桌状态
class TableStatus {
  TableStatus(this.id);

  int id;

  bool isopen = false;

  double amount = 0;
}

// class OrderDetails {}
