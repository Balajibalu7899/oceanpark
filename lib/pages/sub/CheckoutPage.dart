import 'package:flutter/material.dart';
import 'package:ocean_park/components/utilui/CouponButtomSheet.dart';
import 'package:ocean_park/components/utilui/CustomeIconButton.dart';
import 'package:ocean_park/global/texts/light_container_properties.dart';
import 'package:ocean_park/pages/sub/PaymentsPage.dart';

class CheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Total: ₹2500",
                  maxLines: 1,
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                  ),
                  child: Text(
                    "Payment",
                    style: TextStyle(
                      fontSize: Theme.of(context).textTheme.headline2!.fontSize,
                      fontWeight:
                          Theme.of(context).textTheme.headline2!.fontWeight,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return PaymentsPage();
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                height: 120,
                width: MediaQuery.of(context).size.width,
                margin: Theme.of(context).cardTheme.margin,
                padding: EdgeInsets.all(5),
                decoration: containerdecoration,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Address",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        Spacer(),
                        CustomeIconButton(
                          iconname: Icons.delete_rounded,
                          callback: () {},
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        " #48, Harish Layout,Varanasi,J K Halli,R M Nagar,Bangaluru-560036, India",
                        maxLines: 2,
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    )
                  ],
                ),
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
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .fontSize,
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
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .fontSize,
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
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .fontSize,
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
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .fontSize,
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
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .fontSize,
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
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .fontSize,
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
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .fontSize,
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
                          TextButton(
                            child: Text(
                              "Add Coupon",
                              style: TextStyle(
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .headline2!
                                    .fontSize,
                                fontWeight: Theme.of(context)
                                    .textTheme
                                    .headline2!
                                    .fontWeight,
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                            onPressed: () {
                              bottomsheet(context);
                            },
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}