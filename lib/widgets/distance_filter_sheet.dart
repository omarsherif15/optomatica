import 'package:flutter/material.dart';
import 'package:optomatica/consts/colors.dart';

class DistanceFilterSheet extends StatefulWidget {
   const DistanceFilterSheet({super.key});

  @override
  State<DistanceFilterSheet> createState() => _DistanceFilterSheetState();
}

class _DistanceFilterSheetState extends State<DistanceFilterSheet> {
   double currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    const Text('RACE DISTANCE', style: TextStyle(fontSize:25,fontWeight: FontWeight.w900 ),),
                    SizedBox(width: 10,),
                    TextButton(
                        onPressed: (){},
                        child: Text('RESET',
                          style: TextStyle(
                              fontSize:16,
                            color: yellow
                          ),),
                    ),
                  ],
                ),
                Text('0 - 45k ',style: TextStyle(color: lightText,fontSize: 20,letterSpacing: 1),),
                Slider(
                    value: currentSliderValue,
                    min: 0,
                    max: 45,
                    label: currentSliderValue.toString(),
                    thumbColor: yellow,
                    activeColor: yellow,
                    inactiveColor: tabBarText,
                    allowedInteraction: SliderInteraction.tapAndSlide,
                    onChanged: (double value){
                      setState(() {
                        currentSliderValue = value;
                      });
                    }
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
          );
  }
}
