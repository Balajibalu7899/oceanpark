import 'package:flutter/material.dart';
import '/models/product/product.dart';
import '/pages/sub/ProductDetailsPage.dart';
import '/global/texts/light_container_properties.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  ProductCard({
    required this.product,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
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
      child: Container(
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
                if (product.badge != null)
                  Positioned(
                    top: -1,
                    right: -1,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        product.badge!,
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                  )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title!,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Text(
                    product.subTitle!,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Weight: ${product.weight}/${product.unitType}",
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          // Spacer(),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                "₹${product.offerPrice}",
                                style: Theme.of(context).textTheme.headline2,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              if (product.offerPrice! < product.price!)
                                Text(
                                  "₹${product.price}",
                                  style: TextStyle(
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .headline2!
                                        .fontSize,
                                    fontWeight: Theme.of(context)
                                        .textTheme
                                        .headline2!
                                        .fontWeight,
                                    color: Theme.of(context)
                                        .textTheme
                                        .headline4!
                                        .color,
                                    decoration: TextDecoration.lineThrough,
                                    decorationThickness: 3.0,
                                  ),
                                ),
                              SizedBox(
                                width: 10,
                              ),
                              if (product.discount! > 1.0)
                                Text(
                                  "${product.discount!.toStringAsFixed(2)}% Off",
                                  style: Theme.of(context).textTheme.headline2,
                                ),
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                    ],
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
