import 'package:flutter/material.dart';

class CustomeIconButton extends StatelessWidget {
  final IconData iconname;
  final VoidCallback callback;
  CustomeIconButton({required this.iconname, required this.callback, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        height: 35,
        width: 40,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(5)),
        child: Icon(
          iconname,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
