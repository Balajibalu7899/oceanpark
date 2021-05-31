import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '/components/utilui/CustomeSlider.dart';
import '/models/order/order.dart';
import '/global/texts/light_container_properties.dart';
import '/components/cards/OrderedProductDetailsCard.dart';

class OrderDetailsPage extends StatelessWidget {
  final Order order;

  const OrderDetailsPage({Key? key, required this.order}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            margin: Theme.of(context).cardTheme.margin,
            decoration: containerdecoration,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order.status!,
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "${DateFormat('HH:mm a | MMMM d EE').format(order.time!.toDate())}",
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ],
                    ),
                    Spacer(),
                    Text(
                      "₹${order.totalPrice!}",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ],
                ),
                CustomeSlider(order: order),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              "Items",
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: order.products!.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return OrderedProductCard(
                  product: order.products![index],
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            margin: Theme.of(context).cardTheme.margin,
            decoration: containerdecoration,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Orders",
                  style: Theme.of(context).textTheme.headline1,
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      "No of Items in Bag:",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Spacer(),
                    Text(
                      "${order.itemsCount}",
                      style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.headline2!.fontSize,
                        fontWeight:
                            Theme.of(context).textTheme.headline2!.fontWeight,
                        color: Theme.of(context).textTheme.bodyText1!.color,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      "Price:",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Spacer(),
                    Text(
                      "₹${order.price}",
                      style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.headline2!.fontSize,
                        fontWeight:
                            Theme.of(context).textTheme.headline2!.fontWeight,
                        color: Theme.of(context).textTheme.bodyText1!.color,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      "Discount Price:",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Spacer(),
                    Text(
                      "₹${order.discount}",
                      style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.headline2!.fontSize,
                        fontWeight:
                            Theme.of(context).textTheme.headline2!.fontWeight,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
                if (order.couponCode != null) SizedBox(height: 5),
                if (order.couponCode != null)
                  Row(
                    children: [
                      Text(
                        "Coupon Code:",
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      Spacer(),
                      Text(
                        "${order.couponCode}",
                        style: TextStyle(
                          fontSize:
                              Theme.of(context).textTheme.headline2!.fontSize,
                          fontWeight:
                              Theme.of(context).textTheme.headline2!.fontWeight,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                    ],
                  ),
                SizedBox(height: 5),
                Divider(
                  color: Theme.of(context).textTheme.headline1!.color,
                ),
                Row(
                  children: [
                    Text("Total Price:",
                        style: Theme.of(context).textTheme.headline1),
                    Spacer(),
                    Text("₹${order.totalPrice}",
                        style: Theme.of(context).textTheme.headline1),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
