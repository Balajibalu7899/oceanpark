import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ocean_park/components/cards/ProductCard.dart';
import 'package:ocean_park/models/offer/offer.dart';
import 'package:ocean_park/services/offer_service.dart';
import 'package:provider/provider.dart';

class OfferDetailsPage extends StatelessWidget {
  final Offer offer;
  const OfferDetailsPage({Key? key, required this.offer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(offer.title!),
      ),
      body: Consumer<OfferService>(
        builder: (_, offerSanp, __) {
          return ListView.builder(
            itemCount: offerSanp.products.length,
            itemBuilder: (BuildContext context, int index) {
              return ProductCard(product: offerSanp.products[index]);
            },
          );
        },
      ),
    );
  }
}
