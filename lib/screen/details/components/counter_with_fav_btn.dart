import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fooddeliveryapp/models/product.dart';
// import 'package:fooddeliveryapp/models/tableDetail.dart';

import 'cart_counter.dart';

class CounterWithFavBtn extends StatelessWidget {
  final Product product;
  // final TableDetail myTableDetail;
  const CounterWithFavBtn({
    Key key,
    @required this.product,
    // @required this.myTableDetail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        CartCounter(
          product: product,
        ),
        Container(
          padding: EdgeInsets.all(8),
          height: 32,
          width: 32,
          decoration: BoxDecoration(
            color: Color(0xFFFF6464),
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset("assets/icons/heart.svg"),
        )
      ],
    );
  }
}
