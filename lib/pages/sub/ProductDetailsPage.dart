import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/models/product/product.dart';
import '/services/products_service.dart';
import '/components/cards/ProductCard.dart';
import '/components/utilui/cart_button.dart';
import '/global/texts/light_container_properties.dart';

class ProductDetailsPage extends StatelessWidget {
  final Product product;
  const ProductDetailsPage({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        clipBehavior: Clip.none,
        child: Row(
          children: [
            SizedBox(width: 10),
            Text(
              "₹${product.offerPrice}",
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(width: 10),
            Text(
              "₹${(product.price!)}",
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.headline2!.fontSize,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.headline2!.color,
                decoration: TextDecoration.lineThrough,
                decorationThickness: 3.0,
              ),
            ),
            SizedBox(width: 10),
            Text(
              "${product.discount!.toStringAsFixed(1)}% off",
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.headline2!.fontSize,
                fontWeight: Theme.of(context).textTheme.headline2!.fontWeight,
                color: Theme.of(context).primaryColor,
              ),
            ),
            Spacer(),
            CartButton(product: product),
            SizedBox(width: 10)
          ],
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            Container(
              height: 450,
              child: Stack(
                alignment: AlignmentDirectional.topStart,
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                            product.image ??
                                "https://us.123rf.com/450wm/karandaev/karandaev1608/karandaev160800306/62201911-vegetables-fish-meat-and-ingredients-for-cooking-tomatoes-pepper-corn-beef-eggs-top-view-with-copy-s.jpg?ver=6",
                          ),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Positioned(
                    top: 275,
                    right: 0,
                    left: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: Theme.of(context).cardTheme.margin,
                      padding: EdgeInsets.all(10),
                      decoration: containerdecoration,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.title ?? " ",
                            maxLines: 2,
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Fresh Out | Best Quality",
                            maxLines: 1,
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          SizedBox(height: 5),
                          Text(
                            product.description!,
                            maxLines: 3,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            if (product.specials != null)
              SizedBox(
                height: 100,
                child: ListView.builder(
                    itemCount: product.specials!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        width: MediaQuery.of(context).size.width - 100,
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(5),
                        decoration: containerdecoration,
                        child: Row(
                          children: [
                            Image(
                              image:
                                  NetworkImage(product.specials![index].image!),
                              fit: BoxFit.cover,
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.specials![index].title!,
                                    style:
                                        Theme.of(context).textTheme.headline4,
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    product.specials![index].subTitle!,
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ),
            Container(
              padding: EdgeInsets.all(10),
              margin: Theme.of(context).cardTheme.margin,
              decoration: containerdecoration,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.album,
                        color: Theme.of(context).textTheme.headline1!.color,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Delivery",
                        maxLines: 1,
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Text(
                      "Fastest Delivery \nmeat",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                "Similiar",
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Consumer<ProductService>(builder: (context, snapshot, child) {
              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: snapshot.products!.length,
                itemBuilder: (context, index) {
                  return ProductCard(
                    product: snapshot.products![index],
                  );
                },
              );
            })
          ],
        ),
      ),
    );
  }
}
