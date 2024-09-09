import 'package:flutter/material.dart';

import '../../../../../../models/item_model.dart';

class CustomRateDrawer extends StatelessWidget {
  const CustomRateDrawer({super.key, required this.item});
  final ItemModel item;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(5, (index) => _drawStar(index)),
    );
  }

 Widget _drawStar(int index) {
    if (item.rate != 0 && index < item.rate) {
      if (index < item.rate.floor()) {
        // integer number
        return const Icon(
          Icons.star,
          color: Colors.amber,
          size: 20,
        );
      } else if (item.rate.floor() < item.rate) {
        // fraction part
        return const Icon(
          Icons.star_half,
          color: Colors.amber,
          size: 20,
        );
      }
    } else {
      return const Icon(
        Icons.star_border,
        color: Colors.amber,
        size: 20,
      );
    }
    return Container();
  }
}
