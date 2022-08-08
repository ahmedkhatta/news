import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/logic/cubit/news_cubit.dart';
import 'package:news/view/widget/artical_bulider.dart';

class SinceScreen extends StatelessWidget {
  const SinceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).science;
        return ArticleBuilder(list: list);
      },
    );
  }
}
