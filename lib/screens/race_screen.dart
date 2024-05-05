import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:optomatica/data_model/race_model.dart';
import 'package:optomatica/widgets/filter_widget.dart';
import 'package:optomatica/widgets/search_widget.dart';

import '../cubit/races_cubit.dart';
import '../widgets/race_details.dart';

class RacesScreen extends StatelessWidget {
  RacesScreen({super.key});

  List filterRow = [
    'Type',
    'Location',
    'Distance',
    'Date',
  ];

  @override
  Widget build(BuildContext context) {
    RaceCubit cubit = RaceCubit.get(context);
    List<RaceModel> raceModel = cubit.raceModel;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0,right: 16.0, top: 16),
        child: Column(
          children: [
            SearchField(),
            SizedBox(
              height: 60,
              child: ListView.separated(
                  itemBuilder: (context, index) => FilterBox(filterRow[index]),
                  separatorBuilder: (context ,index) => const SizedBox(width: 5,),
                  itemCount: filterRow.length,
                  scrollDirection: Axis.horizontal,


              ),
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) => RaceDetails(raceModel[index]),
                  separatorBuilder: (context, index) => SizedBox(height: 10,),
                  itemCount: 10,
                shrinkWrap: true,
              ),
            ),
          ],
        ),
      ),
    );

  }
}
