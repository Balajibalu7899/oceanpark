import 'package:flutter/material.dart';
import '/global/texts/light_container_properties.dart';
import '/models/order/order_product.dart';

class OrderProductCard extends StatelessWidget {
  final OrderProduct product;

  const OrderProductCard({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 110,
          width: 100,
          margin: EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: NetworkImage(product.image ??
                  "https://us.123rf.com/450wm/karandaev/karandaev1608/karandaev160800306/62201911-vegetables-fish-meat-and-ingredients-for-cooking-tomatoes-pepper-corn-beef-eggs-top-view-with-copy-s.jpg?ver=6"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          bottom: 5,
          left: 20,
          right: 20,
          child: Container(
            height: 20,
            width: 80,
            decoration: containerdecoration,
            child: Center(
              child: Text("₹${product.price}"),
            ),
          ),
        )
      ],
    );
  }
}
