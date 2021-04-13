import 'package:caffe_both_twenty/const/themeColor.dart';
import 'package:caffe_both_twenty/models/fooditem.dart';
import 'package:caffe_both_twenty/page/page_dashboard/cart.dart';
import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'menu/listTileColorBloc.dart';
import 'menu/cartlistBloc.dart';

class Menu extends StatelessWidget {
  const Menu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [
        Bloc((i) => CartListBloc()),
        Bloc((i) => ColorBloc()),
      ],
      child: MaterialApp(
        title: "Caffe Booth Twenty",
        home: HomeMenu(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class HomeMenu extends StatelessWidget {
  const HomeMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: ListView(
          children: <Widget>[
            FirstHalf(),
            SizedBox(height: 45),
            for (var foodItem in fooditemList.foodItems)
              Builder(
                builder: (context) {
                  return ItemContainer(foodItem: foodItem);
                },
              )
          ],
        ),
      )),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 30.0, top: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Menu",
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Color(0xfffd6f19)),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Cart()));
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.shopping_cart,
                      color: Color(0xfffd6f19),
                      size: 30,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FirstHalf extends StatelessWidget {
  const FirstHalf({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(35, 25, 0, 0),
      child: Column(
        children: <Widget>[
          CustomAppBar(),
          SizedBox(height: 30),
          searchBar(),
          SizedBox(height: 45),
          categories(),
        ],
      ),
    );
  }
}

Widget categories() {
  return Container(
      height: 85,
      child: ListView(scrollDirection: Axis.horizontal, children: <Widget>[
        Text("Banana"),
        Text("Banana"),
        Text("Banana"),
        Text("Banana"),
      ]));
}

Widget searchBar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Icon(
        Icons.search,
        color: Color(0xfffd6f19),
      ),
      SizedBox(width: 20),
      Expanded(
        child: TextField(
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            hintText: "Search....",
            contentPadding: EdgeInsets.only(left: 20),
            labelStyle: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade400,
                fontWeight: FontWeight.w600),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Color(0xffe92b05)),
            ),
            hintStyle: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
    ],
  );
}

class ItemContainer extends StatelessWidget {
  ItemContainer({
    @required this.foodItem,
  });

  final FoodItem foodItem;
  final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();

  addToCart(FoodItem foodItem) {
    bloc.addToList(foodItem);
  }

  removeFromList(FoodItem foodItem) {
    bloc.removeFromList(foodItem);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        addToCart(foodItem);
        final snackBar = SnackBar(
          content: Text('${foodItem.title} added to Cart'),
          duration: Duration(milliseconds: 550),
        );

        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: Items(
        desc: foodItem.desc,
        itemName: foodItem.title,
        itemPrice: foodItem.price,
        imgUrl: foodItem.imgUrl,
        leftAligned: (foodItem.id % 2) == 0 ? true : false,
      ),
    );
  }
}

class Items extends StatelessWidget {
  Items({
    @required this.leftAligned,
    @required this.imgUrl,
    @required this.itemName,
    @required this.itemPrice,
    @required this.desc,
  });

  final bool leftAligned;
  final String imgUrl;
  final String itemName;
  final double itemPrice;
  final String desc;

  @override
  Widget build(BuildContext context) {
    double containerPadding = 45;
    double containerBorderRadius = 10;

    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            left: leftAligned ? 0 : containerPadding,
            right: leftAligned ? containerPadding : 0,
          ),
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 200,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: ClipRRect(
                  borderRadius: BorderRadius.horizontal(
                    left: leftAligned
                        ? Radius.circular(0)
                        : Radius.circular(containerBorderRadius),
                    right: leftAligned
                        ? Radius.circular(containerBorderRadius)
                        : Radius.circular(0),
                  ),
                  child: Image.network(
                    imgUrl,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                  padding: EdgeInsets.only(
                    left: leftAligned ? 20 : 0,
                    right: leftAligned ? 0 : 20,
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(itemName,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                  )),
                            ),
                            Text("\$$itemPrice",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                )),
                          ],
                        ),
                        SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: RichText(
                            text: TextSpan(
                                style: TextStyle(
                                    color: Colors.black45, fontSize: 15),
                                children: [
                                  TextSpan(text: "by "),
                                  TextSpan(
                                      text: desc,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700))
                                ]),
                          ),
                        ),
                        SizedBox(height: containerPadding),
                      ])),
            ],
          ),
        )
      ],
    );
  }
}

GestureDetector buildGestureDetector(
    int length, BuildContext context, List<FoodItem> foodItems) {
  return GestureDetector(
    onTap: () {
      if (length > 0) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Cart()));
      } else {
        return;
      }
    },
    child: Container(
      margin: EdgeInsets.only(right: 30),
      child: Text(length.toString()),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.yellow[800], borderRadius: BorderRadius.circular(50)),
    ),
  );
}
