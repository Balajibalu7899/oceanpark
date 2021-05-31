import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '/components/utilui/CustomeTextField.dart';
import '/global/texts/light_container_properties.dart';
import '/models/order/order.dart';
import '/models/order/payment_method.dart';
import '/services/cart_service.dart';
import '/services/order_service.dart';
import 'package:provider/provider.dart';

class PaymentsPage extends StatefulWidget {
  @override
  _PaymentsPageState createState() => _PaymentsPageState();
}

class _PaymentsPageState extends State<PaymentsPage> {
  String? method;
  PaymentMethod? paymentMethod;

  placeOrder(BuildContext context) async {
    await Provider.of<OrderService>(context, listen: false).placeOrder();
    await Provider.of<CartService>(context, listen: false).clearCart();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _cardnumber = TextEditingController();
    TextEditingController _expiredate = TextEditingController();
    TextEditingController _cvv = TextEditingController();

    final _order = Provider.of<OrderService>(context).order;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 20),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Text(
                'Total Ammount',
                style: Theme.of(context).textTheme.headline1,
              ),
              Spacer(),
              Text(
                '₹${_order.totalPrice}',
                style: Theme.of(context).textTheme.headline1,
              ),
            ],
          ),
          SizedBox(height: 10),
          InkWell(
            onTap: () {
              setState(() {
                method = "UPI";
              });
            },
            child: Container(
              padding: EdgeInsets.all(10),
              margin: Theme.of(context).cardTheme.margin,
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                border: method == "UPI"
                    ? Border.all(
                        width: 2,
                        color: Theme.of(context).primaryColor,
                      )
                    : Border(),
                borderRadius: BorderRadius.circular(10),
                boxShadow: containerdecoration.boxShadow,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'UPI Payment',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ],
                  ),
                  if (method == "UPI")
                    Column(
                      children: [
                        SizedBox(height: 10),
                        Text(
                          'Not Avilable Due to RBI New Regulations',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ],
                    )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                method = "CC/DC";
              });
            },
            child: Container(
              padding: EdgeInsets.all(10),
              margin: Theme.of(context).cardTheme.margin,
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                border: method == "CC/DC"
                    ? Border.all(
                        width: 2,
                        color: Theme.of(context).primaryColor,
                      )
                    : Border(),
                borderRadius: BorderRadius.circular(10),
                boxShadow: containerdecoration.boxShadow,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Credit Card/Debit Card',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ],
                  ),
                  if (method == "CC/DC")
                    Column(
                      children: [
                        SizedBox(height: 10),
                        Text(
                          'Not Avilable Due to RBI New Regulations',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ],
                    )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Provider.of<OrderService>(context, listen: false).addPayment(
                PaymentMethod(
                    method: "Cash On Delivery", time: Timestamp.now()),
              );
              setState(() {
                method = "COD";
              });
            },
            child: Container(
              padding: EdgeInsets.all(10),
              margin: Theme.of(context).cardTheme.margin,
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                border: method == "COD"
                    ? Border.all(
                        width: 2,
                        color: Theme.of(context).primaryColor,
                      )
                    : Border(),
                borderRadius: BorderRadius.circular(10),
                boxShadow: containerdecoration.boxShadow,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Cash On Delivery',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ],
                  ),
                  if (method == "COD")
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 5),
                          Text(
                            'Pay On Delivery',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Your Can Pay With Cash/Card/UPI',
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          SizedBox(height: 5),
                          Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                              onPressed: () async {
                                try {
                                  await Provider.of<OrderService>(context,
                                          listen: false)
                                      .placeOrder();
                                  await Provider.of<CartService>(context,
                                          listen: false)
                                      .clearCart();
                                  await Provider.of<OrderService>(context,
                                          listen: false)
                                      .getOrders();
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pop();
                                } catch (err) {
                                  print(err);
                                }
                              },
                              child: Text(
                                'Place Order',
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                ],
              ),
            ),
          ),
          Spacer(),
          Center(
            child: Text(
              'Secure Payment',
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          SizedBox(height: 50)
        ],
      ),
    );
  }
}
