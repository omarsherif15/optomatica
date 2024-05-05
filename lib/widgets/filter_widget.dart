import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:optomatica/consts/colors.dart';
import 'package:optomatica/screens/home_screen.dart';
import 'package:optomatica/widgets/type_filter_sheet.dart';
import 'country_filter_sheet.dart';
import 'date_filter_sheet.dart';
import 'distance_filter_sheet.dart';

class FilterBox extends StatelessWidget {
  const FilterBox(this.filterName, {super.key});
  final String filterName;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
         await showModalBottomSheet(
                 context: context,
                 showDragHandle: true,
                 elevation: 15,
                 enableDrag: true,
                 useRootNavigator: true,
                 isScrollControlled: true,
                 builder: (context){
                   switch(filterName){
                     case 'Type':
                       return TypeFilterSheet();
                     case 'Location':
                       return CountryFilterSheet();
                     case 'Distance':
                       return const DistanceFilterSheet();
                     case 'Date':
                       return const DateFilterSheet();
                     default:
                       return Container();
                   }
                 }
             );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: darkBlue)
          ),
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(filterName),
              const Icon(Icons.arrow_drop_down)
            ],
          ),
        ),
      ),
    );
  }


}
