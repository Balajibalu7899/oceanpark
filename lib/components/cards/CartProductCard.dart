import 'package:flutter/material.dart';
import 'package:ocean_park/components/utilui/CustomeQuantitySelector.dart';
import 'package:ocean_park/global/texts/light_container_properties.dart';
import 'package:ocean_park/models/customer/cart.dart';

class CardProductCard extends StatelessWidget {
  final Cart cart;
  CardProductCard({required this.cart, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Theme.of(context).cardTheme.margin,
      width: MediaQuery.of(context).size.width,
      height: 140,
      decoration: containerdecoration,
      child: Row(
        children: [
          Container(
            height: 110,
            width: 100,
            margin: EdgeInsets.only(left: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: NetworkImage(
                    cart.image ??
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  cart.title ?? "Basa (Pangas) - Boneless",
                  maxLines: 1,
                  style: Theme.of(context).textTheme.headline2,
                ),
                Text(
                  "Boneless Small Cuts",
                  maxLines: 1,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    "₹ ${cart.price}/${cart.quantityType}",
                    maxLines: 1,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    Text(
                      "20% off",
                      maxLines: 1,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Spacer(),
                    CustomeQuantitySelector(
                      productId: cart.productId,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
