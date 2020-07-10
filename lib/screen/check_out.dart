import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/constants.dart';
import 'package:fooddeliveryapp/models/table.dart';
import 'package:fooddeliveryapp/models/tableDetail.dart';
import 'package:provider/provider.dart';

class CheckOut extends StatelessWidget {
  final int index;

  static final routeName = "/checkout";

  const CheckOut({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TableStatusList myTableStatusList = Provider.of<TableStatusList>(context);
    TableDetail myTableDetail = Provider.of<TableDetail>(context);
    return Scaffold(
      backgroundColor: Colors.green,
      body: Container(
        margin: EdgeInsets.fromLTRB(
            kDefaultPaddin, kDefaultPaddin * 2, kDefaultPaddin, kDefaultPaddin),
        padding: EdgeInsets.all(kDefaultPaddin),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(24))),
        child: Column(
          children: <Widget>[
            Text(
              "订单支付页面",
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(color: Colors.black, fontWeight: FontWeight.normal),
            ),
            Container(
                decoration: BoxDecoration(
                  // shape: BoxShape.circle,
                  border: Border.all(color: Colors.white),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("assets/images/qc_code.png"),
                )),
            TotalPrices(),
            Text(
              "开台时间:" +
                  myTableDetail
                      .getOpenTime()
                      .toIso8601String()
                      .split("T")[1]
                      .substring(0, 8),
            ),
            Text("闭台时间:" +
                DateTime.now().toIso8601String().split("T")[1].substring(0, 8)),
            Text("服务工号:" + 8.toString()),
            FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18)),
              // color: product.color,
              color: Colors.red,
              onPressed: () {
                ///加入购物车
                print("支付完成");
                myTableStatusList.deletetable(myTableDetail.getTableId());
                print("订单cart清空");
                myTableDetail.endCart();
                Navigator.pop(context);
              },
              child: Text(
                "支付完成".toUpperCase(),
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TotalPrices extends StatelessWidget {
  const TotalPrices({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TableDetail>(builder: (context, cart, child) {
      return Center(child: Text("￥${cart.getTotalPrices()}"));
    });
  }
}
