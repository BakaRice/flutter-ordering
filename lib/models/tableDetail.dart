import 'package:flutter/cupertino.dart';
import 'package:fooddeliveryapp/models/product.dart';

class Item {
  int count;
  Product product;

  Item(int i, Product p) {
    this.count = i;
    product = p;
  }
}

class TableDetail with ChangeNotifier {
  //记录当前使用台号
  int _tableId;

  DateTime openTime;

  TableDetail({int id}) {
    this._tableId = id;
    notifyListeners();
  }

  List<Item> _items = [];

  List<Item> get items => _items;

  int getTableId() => _tableId;

  DateTime getOpenTime() => openTime;

  setTableId(int id) {
    print("[tabledetails]设置桌号id" + id.toString());
    this._tableId = id;
    this.openTime = DateTime.now();
    notifyListeners();
  }

  addItem(Product p) {
    Item item = _items.firstWhere((i) => i.product == p, orElse: () => null);
    if (item == null) {
      item = Item(0, p);
      _items.add(item);
    }
    item.count++;
    notifyListeners();
  }

  // 从购物车移除商品，判断数量，通知
  removeItem(Product p) {
    Item item = _items.firstWhere((i) => i.product == p, orElse: () => null);
    if (item == null) {
      return;
    }
    item.count--;
    if (item.count == 0) {
      _items.remove(item);
    }
    notifyListeners();
  }

  endCart() {
    _items = [];
  }

  // 获取购物车中指定商品数量，不存在返回0
  int getItemCount(Product p) {
    Item item = _items.firstWhere((i) => i.product == p, orElse: () => null);
    return item == null ? 0 : item.count;
  }

  // 计算总总额。取小数点2位转字符串
  String getTotalPrices() {
    double total = 0;
    for (var item in _items) {
      total += item.product.price * item.count;
    }
    return total.toStringAsFixed(2);
  }
}
