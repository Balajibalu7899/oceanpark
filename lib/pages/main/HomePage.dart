import 'package:flutter/material.dart';
import 'package:ocean_park/components/cards/AdvertisementCard.dart';
import 'package:ocean_park/components/cards/CategoryCard.dart';
import 'package:ocean_park/components/utilui/CustomeSearchBar.dart';

class HomePage extends StatelessWidget {
  TextEditingController _search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 30,
        ),
        CustomeSearchBar(controller: _search),
        SizedBox(
          height: 160,
          child: PageView.builder(
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return AdvertisementCard();
            },
          ),
        ),
        Align(
          alignment: Alignment(-0.9, 1),
          child: Text(
            "Categories",
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        SizedBox(
          height: 180,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return CategoryCard();
              }),
        ),
        Align(
          alignment: Alignment(-0.9, 1),
          child: Text(
            "Products",
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        // ListView.builder(
        //     itemCount: 10,
        //     shrinkWrap: true,
        //     physics: NeverScrollableScrollPhysics(),
        //     itemBuilder: (context, index) {
        //       return ProductCard();
        //     })
      ],
    );
  }
}
