import 'package:flutter/material.dart';
import '/global/texts/light_container_properties.dart';
import '/models/order/order_product.dart';

class OrderedProductCard extends StatelessWidget {
  final OrderProduct product;

  const OrderedProductCard({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Theme.of(context).cardTheme.margin,
      padding: EdgeInsets.all(8.0),
      decoration: containerdecoration,
      child: Row(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: NetworkImage(
                    product.image ??
                        "https://us.123rf.com/450wm/karandaev/karandaev1608/karandaev160800306/62201911-vegetables-fish-meat-and-ingredients-for-cooking-tomatoes-pepper-corn-beef-eggs-top-view-with-copy-s.jpg?ver=6",
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${product.title}",
                  maxLines: 2,
                  style: Theme.of(context).textTheme.headline2,
                ),
                SizedBox(height: 30),
                Text(
                  "Weight: ${product.weight}${product.unitType}",
                  maxLines: 1,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  "Price: ₹${product.price}",
                  maxLines: 1,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
