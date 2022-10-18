import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';


class ShimmerSearchScreen extends StatelessWidget {
  const ShimmerSearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return  Shimmer.fromColors(

      highlightColor: Colors.grey[300]!,

      baseColor: Colors.grey[100]!,
      child: ListView.builder(
        physics: const ScrollPhysics(
          parent: ScrollPhysics(),
        ),
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (context,index){
          return Card(
            child: SizedBox(height: height*.15,),
          );
        },
      ),
    );
  }
}
