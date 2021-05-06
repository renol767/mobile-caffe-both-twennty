import 'package:caffe_both_twenty/models/food_model.dart';
import 'package:caffe_both_twenty/widgets/custom_tabbar.dart';
import 'package:caffe_both_twenty/widgets/food_card.dart';
import 'package:caffe_both_twenty/widgets/food_list_item.dart';
import 'package:caffe_both_twenty/widgets/rating_stars.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    double listItemWidth = MediaQuery.of(context).size.width - 2 * 16;
    return ListView(
      children: [
        SizedBox(
          height: 8,
        ),
        //// Header
        Container(
          margin: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Menu",
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Color(0xfffd6f19)),
                  )
                ],
              ),
            ],
          ),
        ),
        //// List Food Kesamping
        Container(
          height: 230,
          width: double.infinity,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Row(
                children: mockFoods
                    .map((e) => Padding(
                          padding: EdgeInsets.only(
                              left: (e == mockFoods.first) ? 16 : 0, right: 16),
                          child: FoodCard(e),
                        ))
                    .toList(),
              )
            ],
          ),
        ),
        //// List Food By TABS
        Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            children: [
              CustomTabbar(
                selectedIndex: selectedIndex,
                titles: ['Baru', 'Popular', 'Recommended'],
                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),
              SizedBox(height: 10),
              Builder(builder: (_) {
                List<Food> foods = (selectedIndex == 0)
                    ? mockFoods
                    : (selectedIndex == 1)
                        ? []
                        : [];
                return Column(
                  children: foods
                      .map((e) => Padding(
                          padding: EdgeInsets.only(
                              left: 16, right: 8, top: 8, bottom: 8),
                          child:
                              FoodListItem(food: e, itemWidth: listItemWidth)))
                      .toList(),
                );
              }),
            ],
          ),
        ),
        SizedBox(
          height: 80,
        )
      ],
    );
  }
}
