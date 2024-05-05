import 'package:flutter/material.dart';
import 'package:optomatica/consts/colors.dart';

class TypeFilterSheet extends StatelessWidget {
   TypeFilterSheet({super.key});

   String groupValue = 'All';

  final List <String> filterWithType = [
    'Real-Time',
    'Virtual',
    'All'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('RACE TYPE', style: TextStyle(fontSize:28,fontWeight: FontWeight.w900 ),),
                ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context,index) =>  TypeFilter(filterName: filterWithType[index],),
                    separatorBuilder: (context,index) => const Divider(height: 1,thickness: 1,),
                    itemCount: filterWithType.length
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
                      child: const Text('DONE',textAlign: TextAlign.center,),
                    ),
                  ),
                )

              ],
            ),
    );
        }
}

class TypeFilter extends StatefulWidget {
  TypeFilter({super.key, required this.filterName});

  String groupValue = 'All';
  final String filterName;

  @override
  State<TypeFilter> createState() => _TypeFilterState();
}

class _TypeFilterState extends State<TypeFilter> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          Text(widget.filterName),
          const Spacer(),
          Radio(
              value: widget.filterName,
              activeColor: yellow,
              groupValue: widget.groupValue,
              onChanged: (value){
                setState(() {
                  widget.groupValue = value!;
                  print(widget.groupValue);
                  print(value);
                });
              }
          ),
        ],
      ),
    );
  }
}
