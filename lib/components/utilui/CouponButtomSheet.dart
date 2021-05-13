import 'package:flutter/material.dart';
import 'package:ocean_park/components/cards/CouponCard.dart';
import 'package:ocean_park/components/utilui/CustomeSearchBar.dart';

bottomsheet(context) {
  TextEditingController _search = TextEditingController();
  return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 600,
          decoration:
              BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor),
          child: ListView(
            children: [
              CustomeSearchBar(controller: _search),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return CouponCard();
                },
              ),
            ],
          ),
        );
      });
}
