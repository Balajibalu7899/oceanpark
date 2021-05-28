import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ocean_park/components/cards/OrderProductCard.dart';
import 'package:ocean_park/components/utilui/CustomeDottedLine.dart';
import 'package:ocean_park/components/utilui/CustomeSlider.dart';
import 'package:ocean_park/global/texts/light_container_properties.dart';
import 'package:ocean_park/models/order/order.dart';
import 'package:ocean_park/pages/sub/OrderDetailsPage.dart';

class OrdersCard extends StatefulWidget {
  final Order order;

  const OrdersCard({Key? key, required this.order}) : super(key: key);
  @override
  _OrdersCardState createState() => _OrdersCardState();
}

class _OrdersCardState extends State<OrdersCard> {
  bool taped = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          taped = !taped;
        });
      },
      child: AnimatedContainer(
        duration: Duration(seconds: 1),
        height: taped == false ? 210 : 315,
        margin: Theme.of(context).cardTheme.margin,
        padding: EdgeInsets.all(10),
        decoration: containerdecoration,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Theme.of(context).textTheme.headline1!.color,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(
                    Icons.shopping_cart,
                    color: Theme.of(context).backgroundColor,
                  ),
                ),
                SizedBox(width: 5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ordered",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    SizedBox(height: 5),
                    Text(
                      "${DateFormat('HH:mm a | MMMM d EE').format(widget.order.time!.toDate())}",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ],
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "₹${widget.order.totalPrice}",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return OrderDetailsPage(order: widget.order);
                    },
                  ),
                );
              },
              child: Container(
                height: 130,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left: 45, right: 5),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(180, 179, 186, 1),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.order.products!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return OrderProductCard(
                      product: widget.order.products![index],
                    );
                  },
                ),
              ),
            ),
            if (taped) CustomeSlider(order: widget.order),
          ],
        ),
      ),
    );
  }
}
