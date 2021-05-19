import 'package:flutter/material.dart';
import 'package:ocean_park/components/cards/CartProductCard.dart';
import 'package:ocean_park/pages/sub/CheckoutPage.dart';
import 'package:ocean_park/services/cart_service.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartService>(builder: (_, snapshot, child) {
      return Scaffold(
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 50,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Total: ₹${snapshot.totalprice}",
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
                    child: Text("Checkout Order"),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return CheckoutPage(
                                // cart:snapshot.cart
                                );
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
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            itemCount: snapshot.cart.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                key: UniqueKey(),
                onDismissed: (direction) {
                  snapshot.deleteFromCart(index);
                },
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.delete_rounded,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                child: CardProductCard(cart: snapshot.cart[index]),
              );
            },
          ),
        ),
      );
    });
  }
}
