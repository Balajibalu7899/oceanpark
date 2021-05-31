import 'package:flutter/material.dart';
import '/components/cards/ProductCard.dart';
import '/components/utilui/CustomSnackBar.dart';
import '/components/utilui/CustomeIconButton.dart';
import '/components/utilui/product_filter.dart';
import '/models/filter/filter.dart';
import '/services/products_service.dart';
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
      extendBody: true,
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(50),
      //   child: Row(
      //     children: [
      //       SizedBox(
      //         width: (MediaQuery.of(context).size.width) - 45,
      //         // child: CustomeSearchBar(
      //         //   controller: _searchController,
      //         // ),
      //         child: Padding(
      //           padding: const EdgeInsets.all(8.0),
      //           child: TextFormField(
      //             controller: _searchController,
      //             style: Theme.of(context).textTheme.headline4,
      //             decoration: InputDecoration(
      //               hintText: "Search....",
      //               hintStyle: Theme.of(context).textTheme.headline3,
      //               suffixIcon: IconButton(
      //                 icon: Icon(
      //                   Icons.search,
      //                   size: 30,
      //                 ),
      //                 color: Theme.of(context).textTheme.headline1!.color,
      //                 onPressed: () async {
      //                   try {
      //                     // await Provider.of<ProductService>(context,
      //                     //         listen: false)
      //                     //     .searchProduct(_searchController.text);
      //                     search = true;
      //                     setState(() {});
      //                   } catch (error) {
      //                     customeSnackBar(context, "no Such product");
      //                   }
      //                 },
      //               ),
      //               contentPadding:
      //                   Theme.of(context).inputDecorationTheme.contentPadding,
      //               border: InputBorder.none,
      //             ),
      //           ),
      //         ),
      //       ),
      //       CustomeIconButton(
      //         iconname: Icons.filter_alt_sharp,
      //         callback: () {
      //           ProductFilter.show(context);
      //         },
      //       ),
      //     ],
      //   ),
      // ),
      body: Consumer<ProductService>(
        builder: (context, snapshot, child) {
          return search == false
              ? ListView.builder(
                  shrinkWrap: true,
                  // physics: NeverScrollableScrollPhysics(),
                  itemCount: snapshot.products!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ProductCard(
                      product: snapshot.products![index],
                    );
                  })
              : ListView.builder(
                  shrinkWrap: true,
                  // physics: NeverScrollableScrollPhysics(),
                  itemCount: snapshot.matchedProduct!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ProductCard(
                        product: snapshot.matchedProduct![index]);
                  },
                );
        },
      ),
    );
  }
}
