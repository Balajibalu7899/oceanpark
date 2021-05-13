import 'package:flutter/material.dart';
import 'package:ocean_park/components/cards/OrderProductCard.dart';
import 'package:ocean_park/components/utilui/CustomeDottedLine.dart';
import 'package:ocean_park/components/utilui/CustomeSlider.dart';
import 'package:ocean_park/global/texts/light_container_properties.dart';
import 'package:ocean_park/pages/sub/OrderDetailsPage.dart';

class OrdersCard extends StatefulWidget {
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
        height: taped == false ? 230 : 280,
        margin: Theme.of(context).cardTheme.margin,
        decoration: containerdecoration,
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Ordered",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "On Thu, 21 May 2020",
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "₹2754",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return OrderDetailsPage();
                    },
                  ),
                );
              },
              child: Container(
                height: 120,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left: 45, right: 5),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(180, 179, 186, 1),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return OrderProductCard();
                  },
                ),
              ),
            ),
            taped
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DottedLine(
                      lineLength: 300,
                      lineThickness: 1.5,
                      dashLength: 8.0,
                      dashColor: Colors.black,
                      dashGapLength: 8.0,
                    ),
                  )
                : Text(" "),
            taped ? CustomeSlider(state: "cancelled") : Text(" "),
          ],
        ),
      ),
    );
  }
}
