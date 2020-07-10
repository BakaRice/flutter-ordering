import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/constants.dart';
import 'package:fooddeliveryapp/models/product.dart';
import 'package:fooddeliveryapp/screen/details/detail_screen.dart';
import 'package:fooddeliveryapp/screen/order/order_home_screen.dart';

import 'item-card.dart';

/// order页面中body体内容
class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: getMyTabs().map((t) => t.body).toList(),
    );
  }
}

class Menu extends StatelessWidget {
  const Menu({
    Key key,
    @required this.productsList,
  }) : super(key: key);

  final List<Product> productsList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        child: GridView.builder(
            itemCount: productsList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: kDefaultPaddin,
                crossAxisSpacing: kDefaultPaddin,
                childAspectRatio: 0.75),
            itemBuilder: (context, index) => ItemCard(
                  product: productsList[index],
                  press: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                          product: productsList[index],
                        ),
                      )),
                )),
      ),
    );
  }
}
