
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saltuapp/controller/home_controller.dart';

class SearchWidget extends StatelessWidget {
   SearchWidget({Key? key}) : super(key: key);

  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        controller: homeController.searchTextController,
        onFieldSubmitted: (val){
          homeController.getSearchCharacterDetails();
        },

        decoration: InputDecoration(
            filled: true,
          fillColor: Colors.white,
          enabledBorder:   OutlineInputBorder(borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(color: Color(0xFFE1DFDD),width: 1),
          ),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: Colors.blue)),
          contentPadding: const EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
          hintText: "Search",
          prefixIcon: Icon(Icons.search),
          suffixIcon: IconButton(
            onPressed: (){
              homeController.searchTextController.text = "";
            },
            icon: Icon(Icons.close),
          )
        ),

      ),
    );
  }
}
