import 'package:flutter/material.dart';
import 'package:ocean_park/components/utilui/CustomeIconButton.dart';
import 'package:ocean_park/services/cart_service.dart';
import 'package:provider/provider.dart';

class CustomeQuantitySelector extends StatefulWidget {
  final productId;
  CustomeQuantitySelector({required this.productId, Key? key})
      : super(key: key);
  @override
  _CustomeQuantitySelectorState createState() =>
      _CustomeQuantitySelectorState();
}

class _CustomeQuantitySelectorState extends State<CustomeQuantitySelector> {
  int? itemIndex;
  @override
  void initState() {
    itemIndex = Provider.of<CartService>(context, listen: false)
        .productIndex(widget.productId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartService>(builder: (__, snapshot, child) {
      return Container(
        width: 130,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomeIconButton(
                iconname: Icons.minimize_rounded,
                callback: () {
                  Provider.of<CartService>(context, listen: false)
                      .decreaseQuantity(itemIndex!);
                }),
            Text(
              snapshot.cart[itemIndex!].units!.toString(),
              style: TextStyle(
                decoration: TextDecoration.underline,
                fontSize: Theme.of(context).textTheme.headline1!.fontSize,
                fontWeight: Theme.of(context).textTheme.headline1!.fontWeight,
              ),
            ),
            CustomeIconButton(
              iconname: Icons.add,
              callback: () {
                Provider.of<CartService>(context, listen: false)
                    .increaseQuantity(itemIndex!);
              },
            ),
          ],
        ),
      );
    });
  }
}
