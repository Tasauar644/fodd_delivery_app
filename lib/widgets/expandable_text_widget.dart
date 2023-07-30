import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/SmallText.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;


  const ExpandableTextWidget({super.key,
    required this.text,
  });

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String lastHalf;
  bool hiddenText=true;
  double textHeight=Dimensions.screenHeight/7.82;//5.63

  @override
  void initState() {
    super.initState();
    if(widget.text.length>textHeight){
      firstHalf=widget.text.substring(0,textHeight.toInt());
      lastHalf=widget.text.substring(textHeight.toInt()+1,widget.text.length);
    }
    else{
      firstHalf=widget.text;
      lastHalf="";
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: lastHalf.isEmpty?SmallText(text: firstHalf):Column(
        children: [
          SmallText(text: hiddenText?(firstHalf+"...."):(firstHalf+lastHalf),color: Colors.black87,),
          InkWell(
            onTap: (){
              setState(() {
                hiddenText=!hiddenText;
              });

            },
            child: Row(
              children: [
                SmallText(text: "Show more",color: Appcolors.maincolor,),
                Icon(hiddenText?Icons.arrow_drop_down:Icons.arrow_drop_up,color: Appcolors.maincolor,)
              ],
            ),
          )
        ],


      ),
    );
  }
}
