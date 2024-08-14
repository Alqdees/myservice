import 'package:Al_Zab_township_guide/view/Size/SizedApp.dart';
import 'package:flutter/material.dart';

class MultiText extends StatelessWidget {
  String str, con;
  MultiText(this.str, this.con, {super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: getWidth(2),
          vertical: getheight(0.5),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                con,
                style: TextStyle(
                    fontSize: setFontSize(12),
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              width: getWidth(0.2),
            ),
            Expanded(
              flex: 4,
              child: Text(
                str,
                style: TextStyle(
                    fontSize: setFontSize(12),
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: getheight(1),
            ),
          ],
        ),
      ),
    );
  }
}
