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
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: height * .50,
            child: Consumer<SeatProvider>(
              builder: (context, seats, child) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
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
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Table(
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
                  ),
                ],
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
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: buttonContainer(
                BoxDecoration(
                  color: Color(0xffA6A6A6).withOpacity(.16),
                  borderRadius: BorderRadius.circular(10.0),
                ),
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
                height,
                width / 2),
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
    );
  }
}
