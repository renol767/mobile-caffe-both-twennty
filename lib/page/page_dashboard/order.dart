import 'package:caffe_both_twenty/cubit/cubit.dart';
import 'package:caffe_both_twenty/models/fetchuser.dart';
import 'package:caffe_both_twenty/models/food_model.dart';
import 'package:caffe_both_twenty/models/transaction.dart';
import 'package:caffe_both_twenty/page/page_dashboard/order_.dart';
import 'package:caffe_both_twenty/services/user_services.dart';
import 'package:caffe_both_twenty/widgets/custom_tabbar.dart';
import 'package:caffe_both_twenty/widgets/order_list_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class Order extends StatefulWidget {
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  UserService get usersService => GetIt.I<UserService>();
  FetchUser users;
  @override
  void initState() {
    super.initState();
    context.bloc<TransactionCubit>().getTransactions();
    context.bloc<FoodCubit>().getFoods();
    usersService
        .getFetchuser(FirebaseAuth.instance.currentUser.uid)
        .then((value) {
      users = value;
    });
  }

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    double listitemWidth = MediaQuery.of(context).size.width - 2 * 16;
    return BlocBuilder<TransactionCubit, TransactionState>(builder: (_, state) {
      if (state is TransactionLoaded) {
        return ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 8,
                ),
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
                            "Your Orders",
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
                Container(
                  width: double.infinity,
                  child: Column(
                    children: [
                      CustomTabbar(
                          selectedIndex: selectedIndex,
                          titles: ['Progress', 'Complete'],
                          onTap: (index) {
                            setState(() {
                              selectedIndex = index;
                            });
                          }),
                      SizedBox(
                        height: 16,
                      ),
                      Builder(builder: (_) {
                        List<Transaction> transaction = (selectedIndex == 0)
                            ? state.transaction
                                .where((element) =>
                                    element.status ==
                                    TransactionStatus.belumbayar)
                                .toList()
                            : state.transaction
                                .where((element) =>
                                    element.status ==
                                        TransactionStatus.sudahdibayar ||
                                    element.status ==
                                        TransactionStatus.complete)
                                .toList();
                        return Column(
                            children: transaction
                                .map((e) => Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16, bottom: 16),
                                      child: GestureDetector(
                                          onTap: () {
                                            Get.to(() => OrderDetailPage(
                                                nama: users.firstName +
                                                    " " +
                                                    users.lastName,
                                                alamat: users.address,
                                                wa: users.numberwhatsapp,
                                                transaction: e));
                                          },
                                          child: OrderListItem(
                                              transaction: e,
                                              itemWidth: listitemWidth)),
                                    ))
                                .toList());
                      })
                    ],
                  ),
                )
              ],
            )
          ],
        );
      } else {
        return SpinKitFadingCube(
          color: Color(0xfffd6f19),
          size: 30,
        );
      }
    });
  }
}
