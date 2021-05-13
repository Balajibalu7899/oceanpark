import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomeSlider extends StatelessWidget {
  final state;
  CustomeSlider({required this.state, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    switch (state) {
      case "ordered":
        return Container(
          margin: EdgeInsets.only(top: 10, left: 5),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Ordered"),
                  Text("Dispatched"),
                  Text("Delivered"),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Divider(
                        thickness: 3, color: Theme.of(context).accentColor),
                  ),
                  Icon(
                    Icons.brightness_1,
                    color: Theme.of(context).accentColor,
                    size: 20,
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 3,
                      color: Theme.of(context).textTheme.subtitle1!.color,
                    ),
                  ),
                  Icon(
                    Icons.brightness_1_outlined,
                    color: Theme.of(context).textTheme.subtitle1!.color,
                    size: 20,
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 3,
                      color: Theme.of(context).textTheme.subtitle1!.color,
                    ),
                  ),
                  Icon(
                    Icons.brightness_1_outlined,
                    color: Theme.of(context).textTheme.subtitle1!.color,
                    size: 20,
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 3,
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Ordered At: Thu, 21 May 2020",
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ],
          ),
        );
      case "dispatched":
        return Container(
          margin: EdgeInsets.only(top: 10, left: 5),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Ordered"),
                  Text("Dispatched"),
                  Text("Delivered"),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Divider(
                        thickness: 3, color: Theme.of(context).accentColor),
                  ),
                  Icon(
                    Icons.brightness_1,
                    color: Theme.of(context).accentColor,
                    size: 20,
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 3,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  Icon(
                    Icons.brightness_1,
                    color: Theme.of(context).accentColor,
                    size: 20,
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 3,
                      color: Theme.of(context).textTheme.subtitle1!.color,
                    ),
                  ),
                  Icon(
                    Icons.brightness_1_outlined,
                    color: Theme.of(context).textTheme.subtitle1!.color,
                    size: 20,
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 3,
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Dispatched At: Thu, 21 May 2020",
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ],
          ),
        );
      case "delivered":
        return Container(
          margin: EdgeInsets.only(top: 10, left: 5),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Ordered"),
                  Text("Dispatched"),
                  Text("Delivered"),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Divider(
                        thickness: 3, color: Theme.of(context).accentColor),
                  ),
                  Icon(
                    Icons.brightness_1,
                    color: Theme.of(context).accentColor,
                    size: 20,
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 3,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  Icon(
                    Icons.brightness_1,
                    color: Theme.of(context).accentColor,
                    size: 20,
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 3,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  Icon(
                    Icons.brightness_1,
                    color: Theme.of(context).accentColor,
                    size: 20,
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 3,
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Dispatched At: Thu, 21 May 2020",
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ],
          ),
        );
      case "cancelled":
        return Container(
          margin: EdgeInsets.only(top: 10, left: 5),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Ordered"),
                  Text("Cancelled"),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 3,
                      color: Colors.red,
                    ),
                  ),
                  Icon(
                    Icons.brightness_1,
                    color: Colors.red,
                    size: 20,
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 3,
                      color: Colors.red,
                    ),
                  ),
                  Icon(
                    Icons.brightness_1,
                    color: Colors.red,
                    size: 20,
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 3,
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Cancelled At: Thu, 21 May 2020",
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ],
          ),
        );
      default:
        return Container();
    }
  }
}
