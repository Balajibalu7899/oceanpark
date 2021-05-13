import 'package:flutter/material.dart';
import 'package:ocean_park/global/texts/light_container_properties.dart';

class OrderedProductCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Theme.of(context).cardTheme.margin,
      padding: EdgeInsets.all(8.0),
      decoration: containerdecoration,
      child: Row(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: NetworkImage(
                    "https://us.123rf.com/450wm/karandaev/karandaev1608/karandaev160800306/62201911-vegetables-fish-meat-and-ingredients-for-cooking-tomatoes-pepper-corn-beef-eggs-top-view-with-copy-s.jpg?ver=6",
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Basa (Pangas) - Boneless",
                  maxLines: 2,
                  style: Theme.of(context).textTheme.headline2,
                ),
                Text(
                  "Weight: 1 Kg",
                  maxLines: 1,
                  style: Theme.of(context).textTheme.headline4,
                ),
                Text(
                  "Price: 250",
                  maxLines: 1,
                  style: Theme.of(context).textTheme.headline3,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
