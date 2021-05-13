import 'package:flutter/material.dart';

class CustomeOutlineButton extends StatelessWidget {
  final String title;
  final Function tap;
  CustomeOutlineButton({required this.title, required this.tap, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        tap();
      },
      child: Container(
        height: 40,
        width: 100,
        margin: Theme.of(context).cardTheme.margin,
        decoration: BoxDecoration(
          color: Theme.of(context).cardTheme.color,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Theme.of(context).primaryColor,
          ),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).cardTheme.shadowColor!,
              spreadRadius: 0,
              blurRadius: 5,
            ),
          ],
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: Theme.of(context).textTheme.headline2!.fontSize,
              fontWeight: Theme.of(context).textTheme.headline2!.fontWeight,
            ),
          ),
        ),
      ),
    );
  }
}
