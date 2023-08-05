import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saltuapp/controller/home_controller.dart';
import 'package:saltuapp/view/widget/dropdown_widget.dart';
import 'package:saltuapp/view/widget/list_tile.dart';

class CharacterWidget extends StatelessWidget {
  CharacterWidget({Key? key}) : super(key: key);

  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Obx(()=>homeController.characterLoading.value?Center(child: CircularProgressIndicator()):Column(
              children: [
                Expanded(
                  flex: 1,
                  child: DropDownWidget(),
                ),
                Expanded(
                    flex: 6,
                    child:
                        homeController.characterData.value.characters!.length >
                                0
                            ? ListView.builder(
                                shrinkWrap: true,
                                itemCount: homeController
                                    .characterData.value.characters!.length,
                                itemBuilder: (context, index) {
                                  return ListTileRow(
                                      data: homeController.characterData.value
                                          .characters![index],
                                      image:
                                          "https://i.pravatar.cc/150?img=${index + 1}");
                                })
                            : Container(
                                child: Center(
                                  child: Text("No Data Found"),
                                ),
                              ))
              ],
            )
        )

      ),
    );
  }
}
