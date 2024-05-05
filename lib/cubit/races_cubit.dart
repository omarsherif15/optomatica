import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:optomatica/cubit/race_states.dart';
import 'package:optomatica/data_model/race_model.dart';

class RaceCubit extends Cubit<RaceStates> {
  RaceCubit() : super(InitialState());

  static RaceCubit get(context) => BlocProvider.of(context);

  final List <RaceModel> raceModel = [];
  Future<void> readJson() async {
    emit(RacesLoadingState());
    int x = 0;
    final jsonData =
        jsonDecode(await rootBundle.loadString('assets/json/races_data.json'));
    for (var value in (jsonData as Iterable)){
      x++;
      raceModel.add(RaceModel.fromJson(value));
    }
    emit(RacesSuccessState());
    print(raceModel[1].name);
  }
  String parseDate (String date){
    String? year = date.substring(0,4);
    String? month = date.substring(4,6);
    String? day = date.substring(6);
    String? parsedDate = '$day/$month/$year';

    return parsedDate;
  }

  String parseDistance(String distance){
    List <String> distances = distance.split(',');
    List <String> parsedDistances = [];
    print(distances.length);
    for (var i in (distances as Iterable)){
      print(i);
      parsedDistances.add('${i}k');
    }
    print(parsedDistances);
    return parsedDistances.join(', ');
  }

  List<Map<String, dynamic>> filterWithLocation = [
    {
      'name': 'Egypt',
      'isChecked' : false
    },
    {
      'name': 'Sweden',
      'isChecked' : false
    },
    {
      'name': 'United States of America',
      'isChecked' : false
    },
    {
      'name': 'Australia',
      'isChecked' : false
    },
    {
      'name': 'Japan',
      'isChecked' : false
    },
    {
      'name': 'Germany',
      'isChecked' : false
    },
    {
      'name': 'France',
      'isChecked' : false
    },
  ];

  void checkedBox (value, countryName){
    emit(CheckBoxLoadingState());
    filterWithLocation.forEach((element) {
      if (element['name'] == countryName)
        element['isChecked'] = value;
    });
    emit(CheckBoxSuccessState());
    }
}
