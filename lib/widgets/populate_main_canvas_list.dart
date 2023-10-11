import 'package:blocking_tracks/dialogs/backing_tracks_key_dialog.dart';
import 'package:blocking_tracks/styles/customtext_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

import '../decorations/BoxDecorations.dart';

class PopulateMainCanvasList extends StatelessWidget {
  List<String> list;

  PopulateMainCanvasList(this.list);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:  EdgeInsets.all(15.dp),
        child: GridView.builder(
            itemCount: list.length,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 20.dp,
                mainAxisSpacing: 10.dp,
                mainAxisExtent: 60.dp),
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                child: Container(
                  width: 60.dp,
                  height: 60.dp,
                  decoration: index == 0
                      ? BoxDecorations.blueBoxDecoration(8)
                      : BoxDecorations.selectedBoxDecoration(),
                  child: Center(
                    child: Text(
                      list[index],
                      style: CustomTextStyles.white14TextStyle,
                    ),
                  ),
                ),
                onTap: () => {
                showDialog(context: context, builder:(BuildContext context){
                return BackingTracksKeyDialog();
                })
                },
              );
            }
            )
    );
  }
}
