
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/component.dart';
import '../../news/cubit/cubit.dart';
import '../../news/cubit/states.dart';

class Search extends StatelessWidget {

  var search=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (conrext,state){
        var artical =NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body:  Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  color: Colors.grey,
                  child: DefaultTextFeild(
                      onchange: (value){
                        NewsCubit.get(context).getSearch(value);

                      },
                      controller: search,
                      type: TextInputType.text,
                      label: "Searsh",
                      prefix: Icons.search,
                      validate: (ss)
                      {
                        if(ss.isEmpty)
                        {
                          return "Write some thing to search";
                        }
                        return null;
                      }
                  ),
                ),

              ),
              SizedBox(height: 10,),
              Expanded(child: NewsArticales(artical, context,search:false)),
            ],
          ),
        );
      },

    );

  }
}
