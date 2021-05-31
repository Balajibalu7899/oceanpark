import 'package:flutter/material.dart';
import '/components/cards/OrdersCard.dart';
import '/services/order_service.dart';
import 'package:provider/provider.dart';

class OrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Consumer<OrderService>(
        builder: (_, orderSnap, __) {
          return ListView.builder(
            itemCount: orderSnap.orders.length,
            itemBuilder: (BuildContext context, int index) {
              return OrdersCard(order: orderSnap.orders[index]);
            },
          );
        },
      ),
    );
  }
}
