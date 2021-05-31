import 'package:flutter/material.dart';
import 'package:oceanpark/pages/sub/AddressEditPage.dart';
import '/components/utilui/Coupons.dart';
import '/components/utilui/CustomeIconButton.dart';
import '/global/texts/light_container_properties.dart';
import '/pages/sub/PaymentsPage.dart';
import '/services/custome_service.dart';
import '/services/order_service.dart';
import 'package:provider/provider.dart';

class CheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer2<OrderService, CustomerService>(
      builder: (_, orderSnap, customersnapshot, child) {
        return Scaffold(
          bottomNavigationBar: BottomAppBar(
            child: Container(
              height: 50,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Total: ₹${orderSnap.order.totalPrice}",
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
                          fontSize:
                              Theme.of(context).textTheme.headline2!.fontSize,
                          fontWeight:
                              Theme.of(context).textTheme.headline2!.fontWeight,
                        ),
                      ),
                      onPressed: () async {
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
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(10),
                  margin: Theme.of(context).cardTheme.margin,
                  decoration: containerdecoration,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Address Details",
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          Spacer(),
                          CustomeIconButton(
                            iconname: Icons.edit_outlined,
                            callback: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return AddressEditPage();
                                }),
                              );
                            },
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, left: 20.0),
                        child: Text(
                          "Name: ${customersnapshot.customer.addresses![customersnapshot.customer.defaultAddress!].name}",
                          maxLines: 1,
                          textAlign: TextAlign.start,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, left: 20.0),
                        child: Text(
                          "Phone Number: ${customersnapshot.customer.addresses![customersnapshot.customer.defaultAddress!].phone}",
                          maxLines: 1,
                          textAlign: TextAlign.start,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, left: 20.0),
                        child: Text(
                          "Address: ${customersnapshot.customer.addresses![customersnapshot.customer.defaultAddress!].address}",
                          maxLines: 2,
                          textAlign: TextAlign.start,
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      ),
                    ],
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
                            style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .fontSize,
                              fontWeight: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .fontWeight,
                              color: Color.fromRGBO(135, 134, 147, 1),
                            ),
                          ),
                          Spacer(),
                          Text(
                            "${orderSnap.order.products!.length}",
                            style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .fontSize,
                              fontWeight: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .fontWeight,
                              color: Color.fromRGBO(135, 134, 147, 1),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Text(
                            "MRP:",
                            style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .fontSize,
                              fontWeight: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .fontWeight,
                              color: Color.fromRGBO(135, 134, 147, 1),
                            ),
                          ),
                          Spacer(),
                          Text(
                            "₹${orderSnap.order.price}",
                            style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .fontSize,
                              fontWeight: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .fontWeight,
                              color: Color.fromRGBO(135, 134, 147, 1),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
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
                              color: Color.fromRGBO(135, 134, 147, 1),
                            ),
                          ),
                          Spacer(),
                          Text(
                            "₹${orderSnap.order.discount}",
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
                      Row(
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
                          orderSnap.order.couponCode == null
                              ? TextButton(
                                  style: ButtonStyle(
                                    padding:
                                        MaterialStateProperty.all<EdgeInsets>(
                                      EdgeInsets.symmetric(vertical: 0),
                                    ),
                                  ),
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
                                    Coupons.show(context);
                                  },
                                )
                              : Text(
                                  "₹${orderSnap.order.couponAmount} on ${orderSnap.order.couponCode!}",
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
                        ],
                      ),
                      Divider(
                        color: Theme.of(context).textTheme.headline1!.color,
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Text("Total Price:",
                              style: Theme.of(context).textTheme.headline2),
                          Spacer(),
                          Text(
                            "₹${orderSnap.order.totalPrice!}",
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
