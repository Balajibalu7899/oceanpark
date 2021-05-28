import 'package:flutter/material.dart';

class ProductFilter {
  ProductFilter.show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return BottomSheet(
          onClosing: () {},
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Filter",
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      Spacer(),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Apply"),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Categories",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Cut",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Price",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
