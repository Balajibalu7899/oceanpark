import 'package:flutter/material.dart';
import 'package:ocean_park/components/cards/OrderedProductDetailsCard.dart';
import 'package:ocean_park/components/utilui/CustomeSlider.dart';
import 'package:ocean_park/global/texts/light_container_properties.dart';

class OrderDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              height: 150,
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
                  CustomeSlider(state: "ordered"),
                ],
              ),
            ),
            Align(
              alignment: Alignment(-0.9, 1),
              child: Text(
                "Items",
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            ListView.builder(
              itemCount: 2,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return OrderedProductCard();
              },
            ),
            Container(
              height: 250,
              margin: Theme.of(context).cardTheme.margin,
              decoration: containerdecoration,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment(-0.9, 1),
                    child: Text(
                      "Orders",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        Text(
                          "No of Items in Bag:",
                          style: TextStyle(
                            fontSize:
                                Theme.of(context).textTheme.headline2!.fontSize,
                            fontWeight: Theme.of(context)
                                .textTheme
                                .headline2!
                                .fontWeight,
                            color: Color.fromRGBO(
                              135,
                              134,
                              147,
                              1,
                            ),
                          ),
                        ),
                        Spacer(),
                        Text(
                          "5",
                          style: TextStyle(
                            fontSize:
                                Theme.of(context).textTheme.headline2!.fontSize,
                            fontWeight: Theme.of(context)
                                .textTheme
                                .headline2!
                                .fontWeight,
                            color: Color.fromRGBO(
                              135,
                              134,
                              147,
                              1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        Text(
                          "Price:",
                          style: TextStyle(
                            fontSize:
                                Theme.of(context).textTheme.headline2!.fontSize,
                            fontWeight: Theme.of(context)
                                .textTheme
                                .headline2!
                                .fontWeight,
                            color: Color.fromRGBO(
                              135,
                              134,
                              147,
                              1,
                            ),
                          ),
                        ),
                        Spacer(),
                        Text(
                          "₹2600",
                          style: TextStyle(
                            fontSize:
                                Theme.of(context).textTheme.headline2!.fontSize,
                            fontWeight: Theme.of(context)
                                .textTheme
                                .headline2!
                                .fontWeight,
                            color: Color.fromRGBO(
                              135,
                              134,
                              147,
                              1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        Text(
                          "Discount Price:",
                          style: TextStyle(
                            fontSize:
                                Theme.of(context).textTheme.headline2!.fontSize,
                            fontWeight: Theme.of(context)
                                .textTheme
                                .headline2!
                                .fontWeight,
                            color: Color.fromRGBO(
                              135,
                              134,
                              147,
                              1,
                            ),
                          ),
                        ),
                        Spacer(),
                        Text(
                          "₹1600",
                          style: TextStyle(
                            fontSize:
                                Theme.of(context).textTheme.headline2!.fontSize,
                            fontWeight: Theme.of(context)
                                .textTheme
                                .headline2!
                                .fontWeight,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        Text(
                          "Coupon Code:",
                          style: TextStyle(
                            fontSize:
                                Theme.of(context).textTheme.headline2!.fontSize,
                            fontWeight: Theme.of(context)
                                .textTheme
                                .headline2!
                                .fontWeight,
                            color: Color.fromRGBO(
                              135,
                              134,
                              147,
                              1,
                            ),
                          ),
                        ),
                        Spacer(),
                        Text(
                          "Add Coupon",
                          style: TextStyle(
                            fontSize:
                                Theme.of(context).textTheme.headline2!.fontSize,
                            fontWeight: Theme.of(context)
                                .textTheme
                                .headline2!
                                .fontWeight,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Theme.of(context).textTheme.headline1!.color,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text("Total Price:",
                            style: Theme.of(context).textTheme.headline2),
                        Spacer(),
                        Text("₹1600",
                            style: Theme.of(context).textTheme.headline2),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
