import 'package:caffe_both_twenty/cubit/cubit.dart';
import 'package:caffe_both_twenty/models/transaction.dart';
import 'package:caffe_both_twenty/page/page_dashboard/menu/food_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:caffe_both_twenty/models/food_model.dart';
import 'package:caffe_both_twenty/widgets/custom_tabbar.dart';
import 'package:caffe_both_twenty/widgets/food_card.dart';
import 'package:caffe_both_twenty/widgets/food_list_item.dart';
import 'package:caffe_both_twenty/widgets/rating_stars.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  void initState() {
    super.initState();
    context.bloc<TransactionCubit>().getTransactions();
    context.bloc<FoodCubit>().getFoods();
  }

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
          child: BlocBuilder<FoodCubit, FoodState>(
              builder: (_, state) => (state is FoodLoaded)
                  ? ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Row(
                          children: state.foods
                              .map((e) => Padding(
                                    padding: EdgeInsets.only(
                                        left: (e == mockFoods.first) ? 16 : 0,
                                        right: 16),
                                    child: GestureDetector(
                                        onTap: () {
                                          Get.to(FoodDetailPage(
                                            transaction: Transaction(food: e),
                                            onBackButtonPressed: () {
                                              Get.back();
                                            },
                                          ));
                                        },
                                        child: FoodCard(e)),
                                  ))
                              .toList(),
                        )
                      ],
                    )
                  : SpinKitFadingCube(
                      color: Color(0xfffd6f19),
                      size: 30,
                    )),
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
              BlocBuilder<FoodCubit, FoodState>(builder: (_, state) {
                if (state is FoodLoaded) {
                  List<Food> foods = state.foods
                      .where((element) =>
                          element.types.contains((selectedIndex == 0)
                              ? FoodType.new_food
                              : (selectedIndex == 1)
                                  ? FoodType.popular
                                  : FoodType.recommended))
                      .toList();
                  return Column(
                    children: foods
                        .map((e) => Padding(
                            padding: EdgeInsets.only(
                                left: 16, right: 8, top: 8, bottom: 8),
                            child: FoodListItem(
                                food: e, itemWidth: listItemWidth)))
                        .toList(),
                  );
                } else {
                  return SpinKitFadingCube(
                    color: Color(0xfffd6f19),
                    size: 30,
                  );
                }
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
