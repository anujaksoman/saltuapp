import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saltuapp/controller/home_controller.dart';

class DropDownWidget extends StatefulWidget {
  DropDownWidget({Key? key}) : super(key: key);

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  final HomeController homeController = Get.put(HomeController());

  var classValue = "Super Saiyan", seriesValue = "Series 3";

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: DropdownButton<dynamic>(
            value: homeController.selectDropSeriesValue,
            onChanged: (newValue) {
              setState(() {
                homeController.selectDropSeriesValue = newValue;
              });
              homeController.getSearchCharacterDetails();
              print("value= $newValue");
            },
            hint: const Text("Series"),
            items: homeController.seriesList
                ?.map<DropdownMenuItem<dynamic>>((value) {
              return DropdownMenuItem<dynamic>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 2,
          child: DropdownButton<dynamic>(
            value: homeController.selectDropClassValue,
            onChanged: (newValue) {
              setState(() {
                homeController.selectDropClassValue = newValue;
              });
              homeController.getSearchCharacterDetails();
              print("value= $newValue");
            },
            hint: const Text("Class"),
            items: homeController.classList
                ?.map<DropdownMenuItem<dynamic>>((value) {
              return DropdownMenuItem<dynamic>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
            flex: 1,
            child: Text(
              "${homeController.selectDropSeriesValue} ${homeController.selectDropClassValue}",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 14, color: Colors.black),
            ))
      ],
    );
  }
}
