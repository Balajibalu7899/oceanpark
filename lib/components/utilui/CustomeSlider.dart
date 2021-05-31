import 'package:intl/intl.dart';
import 'CustomeDottedLine.dart';
import 'package:flutter/material.dart';
import '/models/order/order.dart';

class CustomeSlider extends StatelessWidget {
  final Order order;
  CustomeSlider({required this.order, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    switch (order.status) {
      case "Ordered":
        return Column(
          children: [
            SizedBox(
              height: 10,
            ),
            DottedLine(
              lineLength: MediaQuery.of(context).size.width - 20,
              lineThickness: 2,
              dashLength: 8.0,
              dashColor: Colors.black,
              dashGapLength: 8.0,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Ordered"),
                Text("Dispatched"),
                Text("Delivered"),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Divider(
                      thickness: 3, color: Theme.of(context).accentColor),
                ),
                Icon(
                  Icons.brightness_1,
                  color: Theme.of(context).accentColor,
                  size: 20,
                ),
                Expanded(
                  child: Divider(
                    thickness: 3,
                    color: Theme.of(context).textTheme.subtitle1!.color,
                  ),
                ),
                Icon(
                  Icons.brightness_1_outlined,
                  color: Theme.of(context).textTheme.subtitle1!.color,
                  size: 20,
                ),
                Expanded(
                  child: Divider(
                    thickness: 3,
                    color: Theme.of(context).textTheme.subtitle1!.color,
                  ),
                ),
                Icon(
                  Icons.brightness_1_outlined,
                  color: Theme.of(context).textTheme.subtitle1!.color,
                  size: 20,
                ),
                Expanded(
                  child: Divider(
                    thickness: 3,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Ordered At: ${DateFormat('HH:mm a | MMMM d EE').format(order.ordered!.time!.toDate())}",
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
          ],
        );
      case "Dispatched":
        return Column(
          children: [
            SizedBox(
              height: 10,
            ),
            DottedLine(
              lineLength: MediaQuery.of(context).size.width - 20,
              lineThickness: 2,
              dashLength: 8.0,
              dashColor: Colors.black,
              dashGapLength: 8.0,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Ordered"),
                Text("Dispatched"),
                Text("Delivered"),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Divider(
                      thickness: 3, color: Theme.of(context).accentColor),
                ),
                Icon(
                  Icons.brightness_1,
                  color: Theme.of(context).accentColor,
                  size: 20,
                ),
                Expanded(
                  child: Divider(
                    thickness: 3,
                    color: Theme.of(context).accentColor,
                  ),
                ),
                Icon(
                  Icons.brightness_1,
                  color: Theme.of(context).accentColor,
                  size: 20,
                ),
                Expanded(
                  child: Divider(
                    thickness: 3,
                    color: Theme.of(context).textTheme.subtitle1!.color,
                  ),
                ),
                Icon(
                  Icons.brightness_1_outlined,
                  color: Theme.of(context).textTheme.subtitle1!.color,
                  size: 20,
                ),
                Expanded(
                  child: Divider(
                    thickness: 3,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Dispatched At: ${DateFormat('HH:mm a | MMMM d EE').format(order.dispatched!.time!.toDate())}",
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ],
        );
      case "Delivered":
        return Column(
          children: [
            SizedBox(
              height: 10,
            ),
            DottedLine(
              lineLength: MediaQuery.of(context).size.width - 20,
              lineThickness: 2,
              dashLength: 8.0,
              dashColor: Colors.black,
              dashGapLength: 8.0,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Ordered"),
                Text("Dispatched"),
                Text("Delivered"),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Divider(
                      thickness: 3, color: Theme.of(context).accentColor),
                ),
                Icon(
                  Icons.brightness_1,
                  color: Theme.of(context).accentColor,
                  size: 20,
                ),
                Expanded(
                  child: Divider(
                    thickness: 3,
                    color: Theme.of(context).accentColor,
                  ),
                ),
                Icon(
                  Icons.brightness_1,
                  color: Theme.of(context).accentColor,
                  size: 20,
                ),
                Expanded(
                  child: Divider(
                    thickness: 3,
                    color: Theme.of(context).accentColor,
                  ),
                ),
                Icon(
                  Icons.brightness_1,
                  color: Theme.of(context).accentColor,
                  size: 20,
                ),
                Expanded(
                  child: Divider(
                    thickness: 3,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Delivered At: ${DateFormat('HH:mm a | MMMM d EE').format(order.delivered!.time!.toDate())}",
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ],
        );
      case "Cancelled":
        return Column(
          children: [
            SizedBox(
              height: 10,
            ),
            DottedLine(
              lineLength: MediaQuery.of(context).size.width - 20,
              lineThickness: 2,
              dashLength: 8.0,
              dashColor: Colors.black,
              dashGapLength: 8.0,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Ordered"),
                Text("Cancelled"),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Divider(
                    thickness: 3,
                    color: Colors.red,
                  ),
                ),
                Icon(
                  Icons.brightness_1,
                  color: Colors.red,
                  size: 20,
                ),
                Expanded(
                  child: Divider(
                    thickness: 3,
                    color: Colors.red,
                  ),
                ),
                Icon(
                  Icons.brightness_1,
                  color: Colors.red,
                  size: 20,
                ),
                Expanded(
                  child: Divider(
                    thickness: 3,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Cancelled At: ${DateFormat('HH:mm a | MMMM d EE').format(order.cancelled!.time!.toDate())}",
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ],
        );
      default:
        return Container();
    }
  }
}
