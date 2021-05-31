import 'package:flutter/material.dart';
import '/components/cards/CartProductCard.dart';
import '/pages/sub/CheckoutPage.dart';
import '/services/cart_service.dart';
import '/services/order_service.dart';
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
                if (snapshot.totalprice > 0)
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).primaryColor,
                      ),
                      child: Text("Checkout Order"),
                      onPressed: () {
                        Provider.of<OrderService>(context, listen: false)
                            .create(snapshot.cart);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return CheckoutPage();
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
          child: snapshot.totalprice > 0
              ? ListView.builder(
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
                )
              : Center(
                  child: Text(
                    "No Items in Cart",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
        ),
      );
    });
  }
}
