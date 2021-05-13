import 'package:flutter/material.dart';
import 'package:ocean_park/global/texts/light_container_properties.dart';

class CouponCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: MediaQuery.of(context).size.width,
      margin: Theme.of(context).cardTheme.margin,
      decoration: containerdecoration,
      child: Row(
        children: [
          SizedBox(
            width: 10,
          ),
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: NetworkImage(
                    """https://us.123rf.com/450wm/karandaev/karandaev1608/karandaev160800306/62201911-vegetables-fish-meat-and-ingredients-for-cooking-tomatoes-pepper-corn-beef-eggs-top-view-with-copy-s.jpg?ver=6""",
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "On minimum purchase of Rs. 1,000",
                  maxLines: 1,
                  style: TextStyle(
                    color: Theme.of(context).textTheme.headline1!.color,
                    fontSize: 12,
                    fontWeight:
                        Theme.of(context).textTheme.headline1!.fontWeight,
                  ),
                ),
                Text("Code: WFEXTRA150",
                    maxLines: 1, style: Theme.of(context).textTheme.subtitle1),
                Text("  Rs. 150 off on minimum purchase of Rs. 1000",
                    maxLines: 2, style: Theme.of(context).textTheme.subtitle1),
                Text("Expiry: MAY 31 2021 11:59:00 P.Ms",
                    maxLines: 1, style: Theme.of(context).textTheme.subtitle2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
