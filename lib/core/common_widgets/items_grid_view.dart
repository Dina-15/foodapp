import 'package:flutter/material.dart';
import 'package:foodapp/models/item_model.dart';
import '../../features/home/data/Presentation/ui/common_widgets/custom_card.dart';

class ItemsGridView extends StatelessWidget {
  ItemsGridView({super.key});
  final List<ItemModel> items = [
    ItemModel(
        image: "assets/images/cheeseBurgur.png",
        name: '''Cheeseburger
Wendy's Burger''',
        rate: 3,
        details:
            "The Cheeseburger Wendy's Burger is a classic fast food burger that packs a punch of flavor in every bite. Made with a juicy beef patty cooked to perfection, it's topped with melted American cheese, crispy lettuce, ripe tomato, and crunchy pickles.",
        price: 8.24),
    ItemModel(
        image: "assets/images/veggleBurgur.png",
        name: '''Hamburger
Veggie Burger''',
        rate: 4.6,
        details:
            "Enjoy our delicious Hamburger Veggie Burger, made with a savory blend of fresh vegetables and herbs, topped with crisp lettuce, juicy tomatoes, and tangy pickles, all served on a soft, toasted bun.",
        price: 9.99),
    ItemModel(
        image: "assets/images/chickenBurgur.png",
        name: '''Hamburger
Chicken Burger''',
        rate: 3.8,
        details:
            "Our chicken burger is a delicious and healthier alternative to traditional beef burgers, perfect for those looking for a lighter meal option. Try it today and experience the mouth-watering flavors of our Hamburger Chicken Burger!",
        price: 9.99),
    ItemModel(
        image: "assets/images/friedChickenBurgur.png",
        name: '''Hamburger
Fried Chicken Burger''',
        rate: 4,
        details:
            "Indulge in our crispy and savory Fried Chicken Burger, made with a juicy chicken patty, hand-breaded and deep-fried to perfection, served on a warm bun with lettuce, tomato, and a creamy sauce.",
        price: 9.99),
    ItemModel(
        image: "assets/images/bgBurgur.png",
        name: '''Hamburger
Fried Chicken Burger''',
        rate: 4.5,
        details:
            "Indulge in our crispy and savory Fried Chicken Burger, made with a juicy chicken patty, hand-breaded and deep-fried to perfection, served on a warm bun with lettuce, tomato, and a creamy sauce.",
        price: 20),
    ItemModel(
        image: "assets/images/largeBurgur.png",
        name: '''Hamburger
Fried Chicken Burger''',
        rate: 4,
        details:
            "Indulge in our crispy and savory Fried Chicken Burger, made with a juicy chicken patty, hand-breaded and deep-fried to perfection, served on a warm bun with lettuce, tomato, and a creamy sauce.",
        price: 40)
  ];
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        childCount: items.length,
        (context, index) => CustomCard(item: items[index]),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 10,
          mainAxisSpacing: 20),
    );
  }
}
