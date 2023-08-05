import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saltuapp/data/model/characterModel.dart' as ch;
import 'package:saltuapp/data/model/legendModel.dart';
import 'package:saltuapp/data/repository/homeRepository.dart';

class HomeController extends GetxController {

  RxBool characterLoading = false.obs,legendLoading = false.obs,aboutLoading = false.obs;

  List<dynamic> seriesList = [];
  List<dynamic> classList = [];


  TextEditingController searchTextController = TextEditingController();
  String selectDropSeriesValue = "";
  String selectDropClassValue = "";

  var _selectSeries = "".obs;
  var _selectClass = "".obs;

  get selectSeriesValue => _selectSeries.value;

  set selectSeriesValue(value) {
    _selectSeries.value = value;
    print("_selectSeries = $_selectSeries");
  }

  get selectClassValue => _selectClass.value;

  set selectClassValue(value) {
    _selectClass.value = value;
    print("_selectClass = $_selectClass");
  }


  void onInit() {
    super.onInit();
    getCharacterDetails();
    getAboutDetails();
    getLegendDetails();

  }

  HomeRepository repository = HomeRepository();
  Rx<ch.CharacterModel> characterData = ch.CharacterModel().obs;
  Rx<LegendModel> legendData = LegendModel().obs;
  Rx<LegendModel> aboutData = LegendModel().obs;
  RxList<ch.Character> characterList = <ch.Character>[].obs;

  Future<void> getCharacterDetails() async {
    characterList.value = [];
    characterLoading.value = true;
    var result = await repository.getCharacterDetails();
    try {
      if (result.runtimeType.toString() == 'CharacterModel') {
        ch.CharacterModel data = result;
        characterData.value = data;
        characterList.value = characterData.value.characters!;

        characterData.value.characters!.forEach((element) {
          if (!seriesList.contains(element.series)) {
            seriesList.add(element.series);
          }
        });

        characterData.value.characters!.forEach((element) {
          if (!classList.contains(element.characterClass)) {
            classList.add(element.characterClass);
          }
        });
         selectDropSeriesValue = seriesList[0];
         selectDropClassValue = classList[0];
        print("series list = $seriesList");

        characterLoading.value = false;
        update();
      } else {
        print("Error Occured");
        characterLoading.value = false;
      }
    } catch (e) {
      debugPrint("catch error $e");
    }
    characterLoading.value = false;
  }


  Future<void> getLegendDetails() async {
    legendLoading.value = true;
    var result = await repository.getLegendDetails();
    try {
      if (result.runtimeType.toString() == 'LegendModel') {
        LegendModel data = result;
        legendData.value = data;
        legendLoading.value = false;
        update();
      } else {
        print("Error Occured");
        legendLoading.value = false;
      }
    } catch (e) {
      debugPrint("catch error $e");
    }
    legendLoading.value = false;
  }


  Future<void> getAboutDetails() async {
    aboutLoading.value = true;
    var result = await repository.getAboutDetails();
    try {
      if (result.runtimeType.toString() == 'LegendModel') {
        LegendModel data = result;
        aboutData.value = data;
        aboutLoading.value = false;
        update();
      } else {
        print("Error Occured");
        aboutLoading.value = false;
      }
    } catch (e) {
      debugPrint("catch error $e");
    }
    aboutLoading.value = false;
  }

  Future<void> getSearchCharacterDetails() async {
    characterList.value = [];
    characterLoading.value = true;
    var result = await repository.getCharacterDetails();
    try {
      if (result.runtimeType.toString() == 'CharacterModel') {
        ch.CharacterModel data = result;
        characterData.value = data;
        characterData.value.characters!.forEach((element) {
          print("${searchTextController.text}  ${selectDropSeriesValue} ${selectDropClassValue}");
          if (element.name.contains(searchTextController.text) && element.series.contains(selectDropSeriesValue) && element.characterClass.contains(selectDropClassValue))
           {
             characterList.add(element);
           }
        });
        characterLoading.value = false;
        update();
      } else {
        print("Error Occured");
        characterLoading.value = false;
      }
    } catch (e) {
      debugPrint("catch error $e");
    }
    characterLoading.value = false;
  }
}