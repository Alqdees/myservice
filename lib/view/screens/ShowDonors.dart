import 'package:Al_Zab_township_guide/Helper/Constant/Constant.dart';
import 'package:Al_Zab_township_guide/controller/provider/Provider.dart';
import 'package:Al_Zab_township_guide/generated/l10n.dart';
import 'package:Al_Zab_township_guide/view/Size/SizedApp.dart';
import 'package:Al_Zab_township_guide/view/ThemeApp/app_theme.dart';
import 'package:Al_Zab_township_guide/view/widget/Cards/CardDonors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../ThemeApp/ColorUsed.dart';

// ignore: must_be_immutable
class ShowDonors extends StatelessWidget {
  static const ROUTE = 'ShowDonors';

  const ShowDonors({super.key});

  @override
  Widget build(BuildContext context) {
    DataSend? dataSend = ModalRoute.of(context)!.settings.arguments as DataSend;
    context.read<Providers>().title = Text(
      S.of(context).donors,
      style: const TextStyle(color: AppTheme.notWhite),
    );
    context.read<Providers>().getData(dataSend.collection);
    context.read<Providers>().actionsicon = const Icon(Icons.search);
    return Consumer<Providers>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 5.0,
            toolbarHeight: getheight(10),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: AppTheme.notWhite,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  value.changewidget(
                    // S.of(context).donors,
                    const TextStyle(
                      color: AppTheme.notWhite,
                    ),
                  );
                },
                icon: Icon(
                  value.actionsicon.icon,
                  color: AppTheme.notWhite,
                ),
              )
            ],
            title: value.title,
            centerTitle: true,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                gradient: LinearGradient(
                  colors: [ColorUsed.primary, ColorUsed.second],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
            systemOverlayStyle: SystemUiOverlayStyle.light,
          ),
          body: 
          value.data.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CircularProgressIndicator(),
                      SizedBox(
                        height: getheight(2),
                      ),
                      Text(S.of(context).wait_service)
                    ],
                  ),
                )
              : 
             SizedBox(
                  height: getheight(100),
                  width: getWidth(100),
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: value.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CardDonors(
                        name:  value.data[index]['name'],
                        type:  dataSend.collection,
                        title: value.data[index]['location'],
                        number:value.data[index]['number'],
                      );
                    },
                  ),
                ),
        );
      },
    );
  }
}
