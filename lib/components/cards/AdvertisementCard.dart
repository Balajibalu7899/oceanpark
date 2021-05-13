import 'package:flutter/material.dart';

class AdvertisementCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsets.only(
        left: 10,
        top: 10,
        bottom: 10,
        right: 5,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            "https://image.shutterstock.com/image-photo/sausages-fish-meat-ingredients-cooking-260nw-472568125.jpg",
          ),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
