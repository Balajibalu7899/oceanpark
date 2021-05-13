import 'package:flutter/material.dart';
import 'package:ocean_park/components/cards/ProductCard.dart';
import 'package:ocean_park/components/utilui/CustomeQuantitySelector.dart';
import 'package:ocean_park/global/texts/light_container_properties.dart';
import 'package:ocean_park/models/customer/cart.dart';
import 'package:ocean_park/models/product/product.dart';
import 'package:ocean_park/services/cart_service.dart';
import 'package:ocean_park/services/products_service.dart';
import 'package:provider/provider.dart';

class ProductDetailsPage extends StatefulWidget {
  final Product product;
  ProductDetailsPage({required this.product, Key? key}) : super(key: key);
  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  bool? inCart = false;
  @override
  void initState() {
    inCart = Provider.of<CartService>(context, listen: false)
        .inCart(widget.product.productId!);
    super.initState();
  }

  int? prize;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        clipBehavior: Clip.none,
        child: Container(
          height: 45,
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(100),
              topRight: Radius.circular(100),
            ),
          ),
          child: Row(
            children: [
              Text(
                "Rs-${widget.product.price}",
                style: Theme.of(context).textTheme.headline2,
              ),
              Spacer(),
              inCart!
                  ? CustomeQuantitySelector(
                      productId: widget.product.productId,
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        child: Text(
                          "Add to Cart",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).primaryColor,
                        ),
                        onPressed: () async {
                          Cart cart = Cart(
                            productId: widget.product.productId,
                            price: widget.product.price,
                            units: 1,
                          );
                          await Provider.of<CartService>(context, listen: false)
                              .addtoCart(cart);
                          inCart =
                              Provider.of<CartService>(context, listen: false)
                                  .inCart(widget.product.productId!);
                          setState(() {});
                        },
                      ),
                    ),
            ],
          ),
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
                            widget.product.image ??
                                "https://us.123rf.com/450wm/karandaev/karandaev1608/karandaev160800306/62201911-vegetables-fish-meat-and-ingredients-for-cooking-tomatoes-pepper-corn-beef-eggs-top-view-with-copy-s.jpg?ver=6",
                          ),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 4,
                    left: 4,
                    child: Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      margin: Theme.of(context).cardTheme.margin,
                      decoration: containerdecoration,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.product.title ?? " ",
                              maxLines: 1,
                              style: Theme.of(context).textTheme.headline2,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Fresh Out | Best Quality",
                              maxLines: 1,
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 8, left: 8, bottom: 8, top: 2),
                            child: Text(
                              widget.product.description!,
                              maxLines: 3,
                              style: Theme.of(context).textTheme.headline4,
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 8, left: 8, bottom: 8, top: 2),
                                child: Text(
                                  "Price:${(widget.product.price).toString()}",
                                  maxLines: 4,
                                  style: Theme.of(context).textTheme.headline2,
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 8, left: 8, bottom: 8, top: 2),
                                child: Text(
                                  "Discount Price:${(widget.product.discount).toString()}",
                                  maxLines: 4,
                                  style: TextStyle(
                                      color: Theme.of(context).accentColor,
                                      fontSize: Theme.of(context)
                                          .textTheme
                                          .headline2!
                                          .fontSize),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 120,
              margin: Theme.of(context).cardTheme.margin,
              width: MediaQuery.of(context).size.width,
              decoration: containerdecoration,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 30,
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Theme.of(context).textTheme.headline1!.color,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.elevator_rounded,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                      ),
                      Text(
                        "Net Weight:${widget.product.weight} ${widget.product.unittype}",
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 30,
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Theme.of(context).textTheme.headline1!.color,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.elevator_rounded,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                      ),
                      Text(
                        "Cut: Fresh cut",
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 30,
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Theme.of(context).textTheme.headline1!.color,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.elevator_rounded,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                      ),
                      Text(
                        "Quality: Best Quality",
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 120,
              margin: Theme.of(context).cardTheme.margin,
              decoration: containerdecoration,
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.album,
                          color: Theme.of(context).textTheme.headline1!.color,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Delivery",
                          maxLines: 1,
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 8, left: 8, bottom: 8, top: 2),
                    child: Text(
                      "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment(-0.9, 1),
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
