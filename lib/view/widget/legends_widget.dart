
import 'package:flutter/material.dart';
import 'package:saltuapp/view/widget/dropdown_widget.dart';
import 'package:saltuapp/view/widget/list_tile.dart';

class LegendsWidget extends StatelessWidget {
  const LegendsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
           Expanded(
             flex: 1,
             child:  DropDownWidget(),),
            Expanded(
              flex: 6,
              child: Center(child: Text("Legend Page")),
            )
          ],
        ),
      ),
    );
  }
}
