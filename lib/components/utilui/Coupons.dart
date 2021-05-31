import 'package:flutter/material.dart';
import '/components/cards/CouponCard.dart';
// import '/components/utilui/CustomeSearchBar.dart';
import '/services/coupon_service.dart';
import '/services/order_service.dart';
import 'package:provider/provider.dart';

class Coupons {
  Coupons.show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Consumer<CouponService>(builder: (_, couponSanp, __) {
          return Container(
            height: MediaQuery.of(context).size.height * 600,
            decoration:
                BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor),
            child: ListView(
              children: [
                // CustomeSearchBar(controller: _search),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: couponSanp.coupons.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Provider.of<OrderService>(context, listen: false)
                            .addCoupon(couponSanp.coupons[index]);
                        Navigator.of(context).pop();
                      },
                      child: CouponCard(coupon: couponSanp.coupons[index]),
                    );
                  },
                ),
              ],
            ),
          );
        });
      },
    );
  }
}
