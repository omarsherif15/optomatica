
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:optomatica/consts/colors.dart';
import 'package:optomatica/consts/fonts.dart';

import '../cubit/races_cubit.dart';
import '../data_model/race_model.dart';

class RaceDetails extends StatelessWidget {

  RaceModel? raceModel;

  RaceDetails( this.raceModel, {super.key});

  @override
  Widget build(BuildContext context) {
    RaceCubit cubit = RaceCubit.get(context);
    return Container(
      height: 250,
      decoration:  BoxDecoration(
          color: cardColor,
          borderRadius: const BorderRadius.all(Radius.circular(10))
      ),
      child: Card(
        elevation: 15,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),topLeft: Radius.circular(10)),
              child: Image(
                image: AssetImage('assets/races/${raceModel!.image}'),
                width: 125,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    raceModel?.type == 'Real-time' ? Icon(Icons.stars,color: yellow) : const Icon(Icons.stars),
                    const SizedBox(height: 5,),
                    Text('${raceModel!.name}',
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: robotoBold,
                          fontWeight: FontWeight.w900
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 5,),
                    RichText(
                        text:  TextSpan(
                      text: 'Organized by \n',
                          style: TextStyle(color: lightText),
                          children: <TextSpan> [
                            TextSpan(
                              text: raceModel?.organizer ?? '',
                              style: TextStyle(color: HexColor('#F77F00'))
                            )
                          ]
                    )),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Icon(Icons.track_changes,color: lightBlue),
                        SizedBox(width: 5,),
                        Expanded(
                          child: Text(cubit.parseDistance(raceModel!.distances!), style: TextStyle(fontSize: 14,color: lightBlue),
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 2,),
                    Row(
                      children: [
                        Icon(Icons.calendar_month,color: lightBlue),
                        SizedBox(width: 5,),
                        Text(cubit.parseDate(raceModel!.date!), style: TextStyle(fontSize: 14,color: lightBlue),),
                        Spacer(),
                        Icon(Icons.share,color: HexColor('#F77F00'),size: 30,)

                      ],
                    ),
                    SizedBox(height: 2,),
                    Row(
                      children: [
                        Icon(Icons.location_on,color: lightBlue,),
                        SizedBox(width: 5,),
                        Expanded(
                          child: Text('${raceModel?.city!}, ${raceModel?.country!}',
                              style: TextStyle(fontSize: 14,color: lightBlue),
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
