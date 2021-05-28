import 'package:flutter/material.dart';
import 'package:ocean_park/components/cards/cut_card.dart';
import 'package:ocean_park/models/product/product.dart';
import 'package:ocean_park/services/cart_service.dart';
import 'package:provider/provider.dart';

class CutSelector {
  CutSelector(BuildContext context, Product product, Function setCart) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return BottomSheet(
          backgroundColor: Colors.transparent,
          onClosing: () {},
          builder: (BuildContext context) {
            return SizedBox(
              height: 150,
              child: PageView.builder(
                controller: PageController(viewportFraction: 0.9),
                itemCount: product.cuts!.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () async {
                      try {
                        await Provider.of<CartService>(context, listen: false)
                            .addtoCart(product, index);
                        setCart(true);
                        Navigator.of(context).pop();
                      } catch (err) {
                        print(err);
                        setCart(false);
                      }
                    },
                    child: CutCard(cut: product.cuts![index]),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
