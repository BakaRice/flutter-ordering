import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fooddeliveryapp/models/product.dart';
import 'package:fooddeliveryapp/screen/cart.dart';
import 'package:fooddeliveryapp/constants.dart';
import 'package:fooddeliveryapp/screen/order/components/body.dart';

class HomeSrcreen extends StatelessWidget {
  static const routeName = '/order';
  final int index;
  //构造函数 同时传入桌号
  HomeSrcreen({Key key, @required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: getMyTabs().length,
      child: Scaffold(
        appBar: buildAppBar(context),
        body: Body(),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        child: Text(
          "口之福火锅",
          style: Theme.of(context)
              .textTheme
              .headline5
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/back.svg"),
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/search.svg",
            // By default our  icon color is white
            color: kTextColor,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/cart.svg",
            // By default our  icon color is white
            color: kTextColor,
          ),
          onPressed: () {
            Navigator.pushNamed(context, OrderCart.routeName, arguments: index);
          },
        ),
        SizedBox(width: kDefaultPaddin / 2)
      ],
      bottom: TabBar(tabs: getMyTabs().map((e) => e.tab).toList()),
    );
  }
}

List<MyTab> getMyTabs() {
  return [
    MyTab(
      Tab(
        child: Text(
          "功夫锅底",
          style: TextStyle(color: Colors.black),
        ),
      ),
      Menu(
        productsList: products,
      ),
    ),
    MyTab(
      Tab(
        child: Text(
          "飘香卤味",
          style: TextStyle(color: Colors.black),
        ),
      ),
      // Icon(Icons.directions_transit, color: Colors.pink, size: 60),
      Menu(productsList: products),
    ),
    MyTab(
      Tab(
        child: Text(
          "安心肉品",
          style: TextStyle(color: Colors.black),
        ),
      ),
      // Icon(Icons.directions_bike, color: Colors.pink, size: 60),
      Menu(productsList: products2),
    )
  ];
}

/// 因此抽象成独立的类
class MyTab {
  Tab tab;
  Widget body;

  MyTab(this.tab, this.body);
}
