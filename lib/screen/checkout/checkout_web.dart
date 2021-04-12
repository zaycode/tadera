import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tedera/screen/base_web_layout.dart';
import 'package:tedera/screen/checkout/checkout_success.dart';
import 'package:tedera/screen/checkout/widget_checkout.dart';
import 'package:tedera/screen/commonts/appbar_web.dart';
import 'package:tedera/screen/home/home_widget.dart';
import 'package:tedera/util/button.dart';
import 'package:tedera/util/color.dart';
import 'package:tedera/util/style_constant.dart';

class CheckOutWeb extends StatefulWidget {
  @override
  _CheckOutWebState createState() => _CheckOutWebState();
}

class _CheckOutWebState extends State<CheckOutWeb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppbarWeb(page: 0),
        body: BaseWebLayout(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 350,
                child: Column(
                  children: [
                    ListView.builder(
                        itemCount: dataCheckOut.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return itemCheckout(dataCheckOut[index], index);
                        }),
                    SizedBox(height: 28),
                    deliveryAddress(),
                  ],
                ),
              ),
              Container(
                width: 350,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    summaryCheckout(context),
                    Button(
                      text: "Checkout",
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    CheckOutSuccess()));
                      },
                    ),
                    SizedBox(height: 56),
                    informationCheckout(),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
