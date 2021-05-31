import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '/components/utilui/CustomeQuantitySelector.dart';
import '/components/utilui/cut_selector.dart';
import '/models/product/product.dart';
import '/services/cart_service.dart';
import 'package:provider/provider.dart';

class CartButton extends StatefulWidget {
  final Product product;
  const CartButton({required this.product, Key? key}) : super(key: key);

  @override
  _CartButtonState createState() => _CartButtonState();
}

class _CartButtonState extends State<CartButton> {
  bool inCart = false;
  int itemIndex = 0;

  @override
  void initState() {
    inCart = Provider.of<CartService>(context, listen: false)
        .inCart(widget.product.productId!);

    if (inCart) {
      itemIndex = Provider.of<CartService>(context, listen: false)
          .productIndex(widget.product.productId!)!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    switch (inCart) {
      case true:
        return CustomeQuantitySelector(
          productId: widget.product.productId,
        );
      case false:
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: ElevatedButton(
            child: Text(
              "Add to Cart",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).primaryColor,
            ),
            onPressed: () async {
              CutSelector(context, widget.product, (cut) {
                inCart = cut;
                if (inCart) {
                  itemIndex = Provider.of<CartService>(context, listen: false)
                      .productIndex(widget.product.productId!)!;
                }
                setState(() {});
              });
            },
          ),
        );
      default:
        return Container();
    }
  }
}
