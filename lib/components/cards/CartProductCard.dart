import 'package:flutter/material.dart';
import 'package:ocean_park/components/utilui/CustomeQuantitySelector.dart';
import 'package:ocean_park/global/texts/light_container_properties.dart';
import 'package:ocean_park/models/cart/cart.dart';

class CardProductCard extends StatelessWidget {
  final Cart cart;
  CardProductCard({required this.cart, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Theme.of(context).cardTheme.margin,
      width: MediaQuery.of(context).size.width,
      height: 150,
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
                fit: BoxFit.cover,
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
                  style: Theme.of(context).textTheme.headline1,
                ),
                Text(
                  "Cut: Curry Cut",
                  maxLines: 1,
                  style: Theme.of(context).textTheme.headline2,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Price: ₹2599/ 1Kg",
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.headline3!.fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    Text(
                      "Total: ₹2599",
                      maxLines: 1,
                      style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.headline2!.fontSize,
                        fontWeight:
                            Theme.of(context).textTheme.headline2!.fontWeight,
                        color: Theme.of(context).textTheme.headline3!.color,
                      ),
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
