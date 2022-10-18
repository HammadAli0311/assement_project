import 'package:assemement_test/constant/colors.dart';
import 'package:assemement_test/constant/icons.dart';
import 'package:assemement_test/model/movie_model.dart';
import 'package:flutter/material.dart';

import '../apis.dart';


class MovieDetailScreen extends StatefulWidget {
  static const routeName='/MovieDetailScreen';
  const MovieDetailScreen({Key? key}) : super(key: key);

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    final movieModal=ModalRoute.of(context)!.settings.arguments as MovieModel;
    print('${imagePath+movieModal.posterPath}?api_key=${apikey}');
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Image.network('${imagePath+movieModal.posterPath}?api_key=${apikey}',height: height*.60,fit: BoxFit.fill,width: double.infinity,),
              Positioned(top: height*.02,left: 20, child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(icon: backIcon,onPressed: ()=>Navigator.pop(context),),
                  Text("Watch",style: TextStyle(color: whiteColor),),
                ],
              ))
            ],
          )
        ],
      ),
    );
  }
}
