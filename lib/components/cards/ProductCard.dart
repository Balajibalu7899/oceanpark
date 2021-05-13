import 'package:flutter/material.dart';
import 'package:ocean_park/components/utilui/CustomeOutlineButton.dart';
import 'package:ocean_park/global/texts/light_container_properties.dart';
import 'package:ocean_park/models/product/product.dart';
import 'package:ocean_park/pages/sub/ProductDetailsPage.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  ProductCard({
    required this.product,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 310,
      margin: Theme.of(context).cardTheme.margin,
      decoration: containerdecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(product.image ??
                        "https://us.123rf.com/450wm/karandaev/karandaev1608/karandaev160800306/62201911-vegetables-fish-meat-and-ingredients-for-cooking-tomatoes-pepper-corn-beef-eggs-top-view-with-copy-s.jpg?ver=6"),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
              ),
              Positioned(
                top: -1,
                right: -1,
                child: Container(
                  height: 20,
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.circular(3)),
                  child: Text(
                    product.tag ?? " ",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment(-0.9, 1),
            child: Text(
              product.title ?? "",
              maxLines: 1,
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          Align(
            alignment: Alignment(-0.9, 1),
            child: Text(
              "Boneless Small cuts",
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(
                      "Weight:${product.weight}/${product.unittype}",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Rs-${product.price} 20%Off",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "Discount:${product.discount}",
                  maxLines: 1,
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              Spacer(),
              CustomeOutlineButton(
                title: "Buy",
                tap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return ProductDetailsPage(
                          product: product,
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
