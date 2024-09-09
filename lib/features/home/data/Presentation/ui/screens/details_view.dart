import 'package:flutter/material.dart';
import 'package:foodapp/utils/constants.dart';
import 'package:foodapp/models/item_model.dart';
import '../common_widgets/custom_rate_drawer.dart';
import '../common_widgets/reusable_container.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({super.key});
  static String id = "DetailsView";
  @override
  State<DetailsView> createState() => _DetailsViewState();
}

double spicy = 0.7;
int portion = 2;

class _DetailsViewState extends State<DetailsView> {
  @override
  Widget build(BuildContext context) {
    ItemModel item = ModalRoute.of(context)!.settings.arguments as ItemModel;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 19),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              // Image
              item.image,
              height: 300,
              width: 350,
              fit: BoxFit.fitHeight,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              item.name, // title
              textAlign: TextAlign.start,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomRateDrawer(item: item),
            const SizedBox(
              height: 20,
            ),
            Text(
              // description
              item.details,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
              maxLines: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _spicySlider(item), // Draw spicySlider
                _portionCounter(item), // Draw portionCounter
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ReusableContainer(
                  text: "\$${item.price}", // Price container
                  width: 100, color: kPrimaryColor,
                ),
                const SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  child: const ReusableContainer(
                    text: "ORDER NOW", // order button
                    width: 220, color: Colors.black,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _spicySlider(ItemModel item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 20,
        ),
        const Text("Spicy", style: TextStyle(fontSize: 14)),
        Slider(
            activeColor: kPrimaryColor,
            value: spicy,
            onChanged: (newValue) {
              setState(() {
                if (spicy >= 0 && spicy <= 1) {
                  spicy = newValue;
                  item.spicy = spicy;
                }
              });
            }),
        const Row(
          children: [
            Text(
              "Mild",
              style: TextStyle(color: Colors.green, fontSize: 14),
            ),
            SizedBox(
              width: 100,
            ),
            Text(
              "Hot",
              style: TextStyle(color: Colors.red, fontSize: 14),
            ),
          ],
        )
      ],
    );
  }

  Widget _portionCounter(ItemModel item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Portion",
          style: TextStyle(fontSize: 14),
          textAlign: TextAlign.start,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            customIconButton(item, Icons.remove),
            SizedBox(
                height: 30,
                width: 30,
                child:
                    Text("  ${item.portion}", style: TextStyle(fontSize: 20))),
            customIconButton(item, Icons.add)
          ],
        )
      ],
    );
  }

  customIconButton(ItemModel item, IconData icon) {
    return Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: kPrimaryColor),
        child: IconButton(
          onPressed: () {
            setState(() {
              if (icon == Icons.add) {
                if (portion < 10) {
                  portion++;
                  item.portion = portion;
                }
              } else if (icon == Icons.remove) {
                if (portion > 0) {
                  portion--;
                  item.portion = portion;
                }
              }
            });
          },
          icon: Icon(icon),
          color: Colors.white,
        ));
  }
}
