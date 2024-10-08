import 'package:Al_Zab_township_guide/Helper/Service/Language/Language.dart';
import 'package:Al_Zab_township_guide/Helper/Service/Language/LanguageController.dart';
import 'package:Al_Zab_township_guide/view/Size/SizedApp.dart';
import 'package:Al_Zab_township_guide/controller/provider/Provider.dart';
import 'package:Al_Zab_township_guide/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Al_Zab_township_guide/view/widget/staticWidget/Multi_text.dart';
import '../../ThemeApp/ColorUsed.dart';

// ignore: must_be_immutable
class CardViewList extends StatelessWidget {
  String? name, presence, specialization, number, title;

  CardViewList(
      {super.key,
      this.name,
      this.presence,
      this.specialization,
      this.number,
      this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation:6,
      child: SingleChildScrollView(
        child: SizedBox(
          child: Row(
            children: [
              Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MultiText(name!, Translation[Language.name]),
                    MultiText(presence!,Translation[Language.time]),
                    MultiText(specialization!, S.of(context).specialization),
                    MultiText(title!, S.of(context).title_service),
                  ],
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: Icon(
                    Icons.call,
                    size: getheight(4),
                    color: ColorUsed.primary,
                  ),
                  onPressed: () {
                    context.read<Providers>().callNumber(number!);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
