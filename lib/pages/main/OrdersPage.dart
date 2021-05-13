import 'package:flutter/material.dart';
import 'package:ocean_park/components/cards/OrdersCard.dart';

class OrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return OrdersCard();
          }),
    );
  }
}
