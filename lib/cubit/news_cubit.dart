import 'package:bloc/bloc.dart';
import 'package:caffe_both_twenty/models/news_model.dart';
import 'package:caffe_both_twenty/models/api_return_value.dart';
import 'package:caffe_both_twenty/services/news-services.dart';
import 'package:equatable/equatable.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  Future<void> getNews() async {
    ApiReturnValue<List<News>> result = await NewsServices.getNews();
    emit(NewsLoaded(result.value));
  }
}
