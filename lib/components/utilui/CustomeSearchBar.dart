import 'package:flutter/material.dart';
import 'package:ocean_park/services/products_service.dart';
import 'package:provider/provider.dart';

class CustomeSearchBar extends StatelessWidget {
  final TextEditingController controller;
  CustomeSearchBar({required this.controller, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 45,
        child: Material(
          elevation: 2,
          borderRadius: BorderRadius.circular(10),
          shadowColor: Theme.of(context).cardTheme.shadowColor,
          child: TextFormField(
            controller: controller,
            style: Theme.of(context).textTheme.headline4,
            decoration: InputDecoration(
              hintText: "Search....",
              hintStyle: Theme.of(context).textTheme.headline3,
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
              contentPadding:
                  Theme.of(context).inputDecorationTheme.contentPadding,
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
