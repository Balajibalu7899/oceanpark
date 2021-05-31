import 'package:flutter/material.dart';

class CustomeIconButton extends StatelessWidget {
  final IconData iconname;
  final VoidCallback callback;
  CustomeIconButton({required this.iconname, required this.callback, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,
      child: ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(5)),
        ),
        onPressed: () {
          callback();
        },
        child: Icon(
          iconname,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
