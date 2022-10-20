import 'package:assemement_test/constant/colors.dart';
import 'package:assemement_test/providers/seat_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant/icons.dart';
import '../constant/textStyle.dart';
import '../constant/widgets.dart';

class SeatMapping extends StatefulWidget {
  static const routeName = "SeatMapping";
  const SeatMapping({Key? key}) : super(key: key);

  @override
  State<SeatMapping> createState() => _SeatMappingState();
}

class _SeatMappingState extends State<SeatMapping> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final String title=ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(onTap: ()=>Navigator.of(context).pop(), child: Icon(Icons.arrow_back_ios,color: blackColor,size: 16,)),
        centerTitle: true,
        title: Column(
          children: [
            Text(title,style: whiteNormalStyle.copyWith(color: blackColor,fontSize: 16),),
            Text("March 5, 2021 | 12:30 Hall 1",style: whiteNormalStyle.copyWith(color: blueColor,fontSize: 12),),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: Colors.grey.shade200,
              elevation: 2.0,
              child: SizedBox(
                height: height * .50,
                child: Consumer<SeatProvider>(
                  builder: (context, seats, child) => Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            Image.asset("assets/screen.png"),
                            Positioned(
                                bottom: 10,
                                child: Text(
                                  "SCREEN",
                                  style: const TextStyle(
                                      color: greyColor, fontSize: 10),
                                )),
                          ],
                        ),
                        SizedBox(height: 50,),
                        Table(
                          columnWidths: columnWidth,
                          children: [
                            ...List.generate(
                                seats.allSeats.length,
                                (index) => TableRow(children: [
                                      TableCell(
                                        child: Text(
                                          '${index + 1}',
                                          style: TextStyle(fontSize: 10),
                                        ),
                                      ),
                                      ...List.generate(
                                          seats.allSeats[index]!.length,
                                          (seatIndex) {
                                        return TableCell(
                                            child: seats.allSeats[index]![seatIndex]
                                                        .name ==
                                                    "space"
                                                ? Text("")
                                                : iconMap[seats
                                                    .allSeats[index]![seatIndex]
                                                    .name] as Widget);
                                      })
                                    ]))
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: whiteColor,
                            child: Icon(Icons.add,color: blackColor,),
                          ),
                            SizedBox(width: 10,),
                            CircleAvatar(
                            radius: 15,
                            backgroundColor: whiteColor,
                            child: Icon(Icons.remove,color: blackColor,),
                          ),
                        ],),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                    flex: 2,
                    child: ListTile(
                      minLeadingWidth: 0.0,
                      leading: icon(Color(0xffCD9D0F)),
                      title: Text("Selected"),
                    )),
                Expanded(
                    flex: 3,
                    child: ListTile(
                      minLeadingWidth: 0.0,
                      leading: icon(Color(0xffA6A6A680)),
                      title: Text("Not Available"),
                    )),
              ],
            ),
            Row(
              children: [
                Expanded(
                    flex: 2,
                    child: ListTile(
                      minLeadingWidth: 0.0,
                      leading: icon(Color(0xff564CA3)),
                      title: Text("VIP (150\$)"),
                    )),
                Expanded(
                    flex: 3,
                    child: ListTile(
                      minLeadingWidth: 0.0,
                      leading: icon(Color(0xff61C3F2)),
                      title: Text("Regular (50\$)"),
                    )),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
              child:  Container(
                  decoration: BoxDecoration(
                    color: Color(0xffA6A6A6).withOpacity(.16),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RichText(text: TextSpan(
                        text: "4 / ",
                          style: BoldStyle.copyWith(fontSize: 14, color: blackColor),
                          children: [
                            TextSpan(
                              text: "3 row",
                              style: whiteNormalStyle.copyWith(fontSize: 10, color: blackColor)
                            )
                        ]
                      )),
                      closeIcon,
                    ],
                  ),
                  height: height*.05,
                  width: width / 3.5),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      child: buttonContainer(
                          BoxDecoration(
                            color: Color(0xffA6A6A6).withOpacity(.16),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("TotalPrice",
                                  style: whiteNormalStyle.copyWith(
                                      fontSize: 14, color: blackColor)),
                              Text("\$ 50",
                                  style: BoldStyle.copyWith(
                                      fontSize: 16, color: blackColor)),
                            ],
                          ),
                          height,
                          width),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () => {},
                      child: buttonContainer(
                          BoxDecoration(
                            color: blueColor,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          Text("Proceed to pay",
                              style: BoldStyle.copyWith(fontSize: 14)),
                          height,
                          width),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
