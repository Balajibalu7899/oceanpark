import 'package:flutter/material.dart';
import 'package:ocean_park/components/cards/CategoryCard.dart';
import 'package:ocean_park/components/cards/ProductCard.dart';
import 'package:ocean_park/models/filter/filter.dart';
import 'package:ocean_park/pages/sub/offer_details_page.dart';
import 'package:ocean_park/services/category_service.dart';
import 'package:ocean_park/services/offer_service.dart';
import 'package:ocean_park/services/page_nav_service.dart';
import 'package:ocean_park/services/products_service.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController _search = TextEditingController();
    return ListView(
      children: [
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: _search,
            style: Theme.of(context).textTheme.headline4,
            decoration: InputDecoration(
              labelText: "Search",
              hintText: "Search....",
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.search,
                  size: 30,
                ),
                color: Theme.of(context).textTheme.headline1!.color,
                onPressed: () {
                  // Provider.of<ProductService>(context)
                  //     .searchProduct(controller.text);
                },
              ),
              border: InputBorder.none,
            ),
          ),
        ),
        Consumer<OfferService>(builder: (_, offerSnap, __) {
          return SizedBox(
            height: 150,
            child: PageView.builder(
              controller: PageController(viewportFraction: 0.9),
              itemCount: offerSnap.offers.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    offerSnap.getProducts(offerSnap.offers[index].id!);
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (BuildContext context) {
                        return OfferDetailsPage(offer: offerSnap.offers[index]);
                      }),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          offerSnap.offers[index].image ??
                              "https://image.shutterstock.com/image-photo/sausages-fish-meat-ingredients-cooking-260nw-472568125.jpg",
                        ),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                );
              },
            ),
          );
        }),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            "Categories",
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Consumer<CategoryService>(
          builder: (_, categorySnap, __) {
            return SizedBox(
              height: 220,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categorySnap.categories.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Provider.of<ProductService>(context, listen: false)
                            .addFilter(Filter(
                                type: FilterType.CATEGORY,
                                data: categorySnap.categories[index].slug));
                        Provider.of<ProductService>(context, listen: false)
                            .applyFilter();
                        Provider.of<PageNavService>(context, listen: false)
                            .changePage(1);
                      },
                      child: CategoryCard(
                          category: categorySnap.categories[index]),
                    );
                  }),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            "Products",
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Consumer<OfferService>(builder: (_, offerSnap, __) {
          return ListView.builder(
            itemCount: offerSnap.products.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ProductCard(product: offerSnap.products[index]);
            },
          );
        })
      ],
    );
  }
}
