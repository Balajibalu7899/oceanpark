import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '/global/texts/light_container_properties.dart';
import '/models/coupon/coupon.dart';

class CouponCard extends StatelessWidget {
  final Coupon coupon;

  const CouponCard({Key? key, required this.coupon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 120,
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
                  coupon.image ??
                      "https://us.123rf.com/450wm/karandaev/karandaev1608/karandaev160800306/62201911-vegetables-fish-meat-and-ingredients-for-cooking-tomatoes-pepper-corn-beef-eggs-top-view-with-copy-s.jpg?ver=6",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Code: ${coupon.code}",
                    maxLines: 1,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  SizedBox(height: 5),
                  Text(
                    coupon.title!,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  SizedBox(height: 5),
                  Text(
                    coupon.subTitle!,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Expires: ${DateFormat('MMMM d EE - HH:mm a').format(coupon.expiry!.toDate())}",
                    maxLines: 1,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
