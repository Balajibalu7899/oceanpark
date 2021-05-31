import 'package:flutter/material.dart';
import '/models/product/cut.dart';

class CutCard extends StatelessWidget {
  final Cut cut;
  const CutCard({required this.cut, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Image(
            width: 150,
            height: 150,
            image: NetworkImage(cut.image ?? ""),
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Text(
                    cut.title!,
                    style: Theme.of(context).textTheme.headline2,
                    maxLines: 3,
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
