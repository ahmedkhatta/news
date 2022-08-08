import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/logic/cubit/news_cubit.dart';
import 'package:news/view/widget/artical_bulider.dart';
import 'package:news/view/widget/text_form_feild.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              TextFormApp(
                hintText: "search hear...",
                obscureText: false,
                icon: Icons.search,
                keyboardType: TextInputType.text,
                controller: searchController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return " search must not be empty";
                  } else {
                    return null;
                  }
                },
                onChanged: (value) {
                  NewsCubit.get(context).getSearch(value);
                },
              ),
              Expanded(child: ArticleBuilder(list: list,isSearch: true,)),
            ],
          ),
        );
      },
    );
  }
}
