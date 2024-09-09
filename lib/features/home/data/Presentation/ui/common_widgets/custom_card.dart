import 'package:flutter/material.dart';
import 'package:foodapp/models/item_model.dart';
import '../screens/details_view.dart';
import 'custom_rate_drawer.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.item});
  final ItemModel item;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){Navigator.pushNamed(context,DetailsView.id, arguments: item);}, ////////////////
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0, 7),
                  spreadRadius: 1,
                  blurRadius: 5),
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                item.image,
                height: 129,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                item.name,
                textAlign: TextAlign.start,
                style:const  TextStyle(fontSize: 16),
              ),
              Row(
                children: [
                  CustomRateDrawer(item: item),

                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_border,
                        color: Colors.redAccent,
                        size: 30,
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
