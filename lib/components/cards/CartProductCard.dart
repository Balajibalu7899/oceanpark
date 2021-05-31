import 'package:flutter/material.dart';
import '/components/utilui/CustomeQuantitySelector.dart';
import '/global/texts/light_container_properties.dart';
import '/models/cart/cart.dart';

class CardProductCard extends StatelessWidget {
  final CartProduct cart;
  CardProductCard({required this.cart, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Theme.of(context).cardTheme.margin,
      width: MediaQuery.of(context).size.width,
      height: 130,
      decoration: containerdecoration,
      child: Row(
        children: [
          Container(
            width: 100,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(
                  cart.image ??
                      "https://us.123rf.com/450wm/karandaev/karandaev1608/karandaev160800306/62201911-vegetables-fish-meat-and-ingredients-for-cooking-tomatoes-pepper-corn-beef-eggs-top-view-with-copy-s.jpg?ver=6",
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 5,
                ),
                Text(
                  cart.title!,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.headline2,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Cut: ${cart.cut}",
                  maxLines: 1,
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Price: ₹${cart.offerPrice}/ ${cart.weight}${cart.unitType}",
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.headline6!.fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    Text(
                      "Total: ₹${cart.offerPrice! * cart.quantity!}",
                      maxLines: 1,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Spacer(),
                    CustomeQuantitySelector(
                      productId: cart.productId,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
