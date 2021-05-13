import 'package:flutter/material.dart';
import 'package:ocean_park/components/cards/ProductCard.dart';
import 'package:ocean_park/components/utilui/CustomSnackBar.dart';
import 'package:ocean_park/components/utilui/CustomeIconButton.dart';
import 'package:ocean_park/services/products_service.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  TextEditingController _searchController = TextEditingController();
  bool search = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            snap: true,
            floating: true,
            titleSpacing: 8,
            pinned: true,
            backgroundColor: Colors.white,
            //expandedHeight: 80,
            flexibleSpace: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: (MediaQuery.of(context).size.width) - 45,
                        // child: CustomeSearchBar(
                        //   controller: _searchController,
                        // ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 45,
                            child: Material(
                              elevation: 2,
                              borderRadius: BorderRadius.circular(10),
                              shadowColor:
                                  Theme.of(context).cardTheme.shadowColor,
                              child: TextFormField(
                                controller: _searchController,
                                style: Theme.of(context).textTheme.headline4,
                                decoration: InputDecoration(
                                  hintText: "Search....",
                                  hintStyle:
                                      Theme.of(context).textTheme.headline3,
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      Icons.search,
                                      size: 30,
                                    ),
                                    color: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .color,
                                    onPressed: () async {
                                      try {
                                        await Provider.of<ProductService>(
                                                context,
                                                listen: false)
                                            .searchProduct(
                                                _searchController.text);
                                        search = true;
                                        setState(() {});
                                      } catch (error) {
                                        customeSnackBar(
                                            context, "no Such product");
                                      }
                                    },
                                  ),
                                  contentPadding: Theme.of(context)
                                      .inputDecorationTheme
                                      .contentPadding,
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      CustomeIconButton(
                          iconname: Icons.filter_alt_sharp, callback: () {}),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Consumer<ProductService>(builder: (context, snapshot, child) {
            return SliverList(
              delegate: SliverChildListDelegate(
                [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                            child: search == false
                                ? ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: snapshot.products!.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return ProductCard(
                                        product: snapshot.products![index],
                                      );
                                    })
                                : ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: snapshot.matchedProduct!.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return ProductCard(
                                          product:
                                              snapshot.matchedProduct![index]);
                                    }))
                      ],
                    ),
                  )
                ],
              ),
            );
          })
        ],
      ),
    );
  }
}
