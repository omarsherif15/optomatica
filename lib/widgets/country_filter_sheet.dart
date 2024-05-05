import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:optomatica/consts/colors.dart';
import 'package:optomatica/cubit/races_cubit.dart';
import 'package:optomatica/widgets/search_widget.dart';

class CountryFilterSheet extends StatelessWidget {
  CountryFilterSheet({super.key});

  bool? _isChecked;


  @override
  Widget build(BuildContext context) {
    RaceCubit cubit = RaceCubit.get(context);
    return DraggableScrollableSheet(
        initialChildSize: 1,
        builder: (BuildContext context, ScrollController scrollController) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SizedBox(
          height: 1000,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  const Text('RACE LOCATION',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w900)),
                  const SizedBox(
                    width: 10,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'RESET',
                      style: TextStyle(fontSize: 16, color: yellow),
                    ),
                  ),
                ],
              ),
              SearchField(),
              Expanded(
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) =>
                        CountryWidget(cubit.filterWithLocation[index]['name'],cubit.filterWithLocation[index]['isChecked']),
                    separatorBuilder: (context, index) => const Divider(
                          height: 1,
                          thickness: 1,
                        ),
                    itemCount: cubit.filterWithLocation.length),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: InkWell(
                  onTap: (){},
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: yellow,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    height: 45,
                    child: Text('DONE',textAlign: TextAlign.center,),
                  ),
                ),
              )

            ],
          ),
        ),
      );
    });
  }
}

class CountryWidget extends StatefulWidget {
  CountryWidget(this.countryName,this._isChecked, {super.key});
  bool _isChecked;
  final String countryName;

  @override
  State<CountryWidget> createState() => _CountryWidgetState();
}

class _CountryWidgetState extends State<CountryWidget> {
  @override
  Widget build(BuildContext context) {
    RaceCubit cubit = RaceCubit.get(context);

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          Text(widget.countryName),
          const Spacer(),
          Checkbox(
              activeColor: yellow,
              checkColor: darkBlue,
              value: widget._isChecked,
              onChanged: (value) {
                cubit.checkedBox(value, widget.countryName);
              }),
        ],
      ),
    );
  }
}
