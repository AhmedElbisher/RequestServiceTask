import 'package:flutter/material.dart';
import 'package:servicerequest/Constants.dart';
import 'package:servicerequest/widgets/ConfirmButton.dart';
import 'package:servicerequest/widgets/CustomBottomSheetContainer.dart';
import 'package:servicerequest/widgets/grayLine.dart';

class BottomSheetWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomBottomSheetContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GrayLine(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            color: Color(0xfff1f1f1),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "550 SRA",
                  style: Constants.KProviderTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "صيانة السيارة",
                      textAlign: TextAlign.end,
                      style: Constants.KProviderTextStyle,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 50.0,
                      width: 50.0,
                      child: Image(
                        image: AssetImage("images/providerMarker.png"),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.arrow_back_ios, size: 15),
                Text(
                  "كهربائي",
                  style: TextStyle(
                      color: Color(0xff9e9999),
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Constants.KPrimaryColor,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: GestureDetector(
                    onTap: () {},
                    child: Material(
                        elevation: 4,
                        color: Constants.KPrimaryColor,
                        child: Image(
                          width: 50,
                          height: 40,
                          image: AssetImage("images/date.png"),
                        )),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                    child: ConfirmButton(
                  text: "تأكيد",
                  onPress: () {},
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
