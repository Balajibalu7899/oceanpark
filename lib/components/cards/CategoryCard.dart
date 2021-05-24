import 'package:flutter/material.dart';
import 'package:ocean_park/global/texts/light_container_properties.dart';

class CategoryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width / 2) - 20,
      padding: EdgeInsets.all(8),
      margin: Theme.of(context).cardTheme.margin,
      decoration: containerdecoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://us.123rf.com/450wm/karandaev/karandaev1608/karandaev160800306/62201911-vegetables-fish-meat-and-ingredients-for-cooking-tomatoes-pepper-corn-beef-eggs-top-view-with-copy-s.jpg?ver=6"),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Spacer(),
          Text(
            "Fresh Cut",
            style: Theme.of(context).textTheme.headline2,
          ),
        ],
      ),
    );
  }
}
