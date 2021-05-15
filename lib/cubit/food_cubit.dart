import 'package:bloc/bloc.dart';
import 'package:caffe_both_twenty/models/api_return_value.dart';
import 'package:caffe_both_twenty/models/food_model.dart';
import 'package:caffe_both_twenty/services/food_services.dart';
import 'package:equatable/equatable.dart';

part 'food_state.dart';

class FoodCubit extends Cubit<FoodState> {
  FoodCubit() : super(FoodInitial());

  Future<void> getFoods() async {
    ApiReturnValue<List<Food>> result = await FoodServices.getFoods();

    if (result.value != null) {
      emit(FoodLoaded(result.value));
    } else {
      emit(FoodLoadingFailed(result.message));
    }
  }
}
