import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fooddeliveryapp/constants.dart';
import 'package:fooddeliveryapp/models/tableDetail.dart';
import 'package:fooddeliveryapp/screen/check_out.dart';
import 'package:fooddeliveryapp/screen/details/components/add_to_cart.dart';
import 'package:fooddeliveryapp/screen/table.dart';
import 'package:provider/provider.dart';

class OrderCart extends StatelessWidget {
  static const routeName = "/cart";
  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('购物车'),
      // ),
      appBar: buildAppBar(context),
      body: ItemList(
        index: index,
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final int index;

  const ItemList({Key key, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(child: CartList()),
        // TotalPrice(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin / 2),
          child: AddToCart(pressButton: () {
            //进行路由跳转  直接删除栈中元素 跳转到tablepage
            Navigator.of(context).pushNamedAndRemoveUntil(
                CheckOut.routeName, ModalRoute.withName(TablePage.routeName),
                arguments: index);
          }),
        )
      ],
    );
  }
}

class CartList extends StatelessWidget {
  const CartList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TableDetail>(
      builder: (c, cart, child) {
        return ListView.separated(
          itemBuilder: (c, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    constraints: BoxConstraints(maxHeight: kDefaultPaddin * 3),
                    child: Image.asset(
                      cart.items[index].product.image,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    '${cart.items[index].product.title}',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                Expanded(flex: 1, child: Text('数量：${cart.items[index].count}')),
                Expanded(
                  flex: 1,
                  child: cart.items[index].product.status == true
                      ? Text("已制作")
                      : FlatButton(
                          color: cart.items[index].product.color,
                          child: Text("退菜"),
                          onPressed: () {
                            print("退菜");
                            cart.removeItem(cart.items[index].product);
                          },
                        ),
                )
              ],
            );
          },
          separatorBuilder: (_, __) => Divider(),
          itemCount: cart.items.length,
        );
      },
    );
  }
}

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    // backgroundColor: product.color,
    leading: IconButton(
      icon: SvgPicture.asset(
        'assets/icons/back.svg',
        color: Colors.white,
      ),
      onPressed: () => Navigator.pop(context),
    ),
    title: TotalPrice(),
    actions: <Widget>[
      IconButton(
        icon: SvgPicture.asset("assets/icons/search.svg"),
        onPressed: () {},
      ),
      // IconButton(
      //   icon: SvgPicture.asset("assets/icons/cart.svg"),
      //   onPressed: () {
      //     Navigator.pushNamed(context, OrderCart.routeName);
      //   },
      // ),
      SizedBox(width: kDefaultPaddin / 2)
    ],
  );
}

class TotalPrice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TableDetail>(
      builder: (context, cart, widget) {
        return Text('总额：${cart.getTotalPrices()}',
            style: TextStyle(color: Colors.white, fontSize: 20));
      },
    );
  }
}
