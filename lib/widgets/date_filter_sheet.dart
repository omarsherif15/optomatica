import 'package:flutter/material.dart';
import 'package:optomatica/consts/colors.dart';
import 'package:intl/intl.dart';

class DateFilterSheet extends StatefulWidget {
  const DateFilterSheet({super.key});

  @override
  State<DateFilterSheet> createState() => _DateFilterSheetState();
}

class _DateFilterSheetState extends State<DateFilterSheet> {
  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    fromDateController.text = DateFormat.yMMMMd('en_US').format(DateTime.now());
    toDateController.text = DateFormat.yMMMMd('en_US').format(DateTime.now().add(const Duration(days: 30)));
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
              const Text('RACE DATE', style: TextStyle(fontSize:25,fontWeight: FontWeight.w900 )),
              SizedBox(width: 20,),
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
          const Text('From'),
          DateSearchBar(controller: fromDateController),
          const Text('To'),
          DateSearchBar(controller: toDateController),
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
class DateSearchBar extends StatelessWidget {
  const DateSearchBar({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: SizedBox(
        height: 50,
        child: TextField(
          cursorColor: darkBlue,
          textAlignVertical: TextAlignVertical.center,
          readOnly: true,
          controller: controller,
          decoration:  InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: lightText)
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: lightText)
              ),
              prefixIcon: Icon(Icons.calendar_month),
              fillColor: Colors.white,
          ),
          onTap: (){
            showDatePicker(
                context: context,
                firstDate: DateTime(2005,1,1),
                lastDate: DateTime(2030,12,31),
            ).then((selectedDate) {
              if(selectedDate!=null){
                controller.text = DateFormat.yMMMMd('en_US').format(selectedDate);
              }
            });
          },
          // ),
        ),
      ),
    );
  }
}
