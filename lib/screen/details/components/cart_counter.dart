import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/constants.dart';
import 'package:fooddeliveryapp/models/product.dart';
import 'package:fooddeliveryapp/models/tableDetail.dart';
import 'package:provider/provider.dart';

class CartCounter extends StatefulWidget {
  final Product product;
  // final TableDetail myTableDetail;

  const CartCounter({
    Key key,
    @required this.product,
  }) : super(key: key);
  @override
  _CartCounterState createState() => _CartCounterState(product);
}

class _CartCounterState extends State<CartCounter> {
  final Product product;

  _CartCounterState(this.product);
  @override
  Widget build(BuildContext context) {
    final myTableDetail = Provider.of<TableDetail>(context);
    int numOfItems = myTableDetail.getItemCount(product);
    return Row(
      children: <Widget>[
        buildOutlineButton(
          icon: Icons.remove,
          press: () {
            if (numOfItems > 0) {
              setState(() {
                numOfItems--;
                myTableDetail.removeItem(product);
                print("[通知]减少商品" +
                    product.id.toString() +
                    "NUMS:" +
                    myTableDetail.getItemCount(product).toString());
              });
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin / 2),
          child: Text(
            // if our item is less  then 10 then  it shows 01 02 like that
            numOfItems.toString().padLeft(2, "0"),
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        buildOutlineButton(
            icon: Icons.add,
            press: () {
              setState(() {
                numOfItems++;
                myTableDetail.addItem(product);
                print("[通知]添加商品" +
                    product.id.toString() +
                    "NUMS:" +
                    myTableDetail.getItemCount(product).toString());
              });
            }),
      ],
    );
  }

  SizedBox buildOutlineButton({IconData icon, Function press}) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlineButton(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
        onPressed: press,
        child: Icon(icon),
      ),
    );
  }
}
