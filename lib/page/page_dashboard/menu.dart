import 'package:caffe_both_twenty/cubit/cubit.dart';
import 'package:caffe_both_twenty/cubit/news_cubit.dart';
import 'package:caffe_both_twenty/models/transaction.dart';
import 'package:caffe_both_twenty/page/page_dashboard/menu/food_detail_page.dart';
import 'package:caffe_both_twenty/page/page_dashboard/menu/news_detail.dart';
import 'package:caffe_both_twenty/widgets/news_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:caffe_both_twenty/models/food_model.dart';
import 'package:caffe_both_twenty/widgets/custom_tabbar.dart';
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
    context.bloc<NewsCubit>().getNews();
    FoodState state = context.bloc<FoodCubit>().state;
  }

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
                  ),
                ],
              ),
            ],
          ),
        ),
        //// List Food Kesamping
        Container(
          height: 230,
          width: double.infinity,
          child: BlocBuilder<NewsCubit, NewsState>(
              builder: (_, state) => (state is NewsLoaded)
                  ? ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Row(
                          children: state.news
                              .map((e) => Padding(
                                    padding: EdgeInsets.only(
                                        left: (e == state.news.first) ? 16 : 0,
                                        right: 16),
                                    child: GestureDetector(
                                        onTap: () {
                                          Get.to(NewsDetailPage(
                                            news: e,
                                          ));
                                          // Get.to(FoodDetailPage(
                                          //   transaction: Transaction(food: e),
                                          //   onBackButtonPressed: () {
                                          //     Get.back();
                                          //   },
                                          // ));
                                        },
                                        child: NewsCard(e)),
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
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "List Food",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xfffd6f19)),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10),
              BlocBuilder<FoodCubit, FoodState>(builder: (_, state) {
                if (state is FoodLoaded) {
                  // List<Food> foods = state.foods
                  //     .where((element) =>
                  //         element.types.contains((selectedIndex == 0)
                  //             ? FoodType.new_food
                  //             : (selectedIndex == 1)
                  //                 ? FoodType.popular
                  //                 : FoodType.recommended))
                  //     .toList();
                  return Column(
                    children: state.foods
                        .map((e) => Padding(
                            padding: EdgeInsets.only(
                                left: 16, right: 8, top: 8, bottom: 8),
                            child: GestureDetector(
                              onTap: () {
                                Get.to(FoodDetailPage(
                                  transaction: Transaction(food: e),
                                  onBackButtonPressed: () {
                                    Get.back();
                                  },
                                ));
                              },
                              child: FoodListItem(
                                  food: e, itemWidth: listItemWidth),
                            )))
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
