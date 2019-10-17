
import 'package:flutter/material.dart';
import 'package:flutter_app/model/combination.model.dart';
import 'package:flutter_app/model/mastermind.model.dart';
import 'package:flutter_app/utils/settings.utils.dart';
import 'peg.widget.dart';

class CombinationWidget extends StatefulWidget {

  final CombinationModel combination;

  CombinationWidget({Key key, @required this.combination}) : super(key: key);

  @override
  _CombinationWidgetState createState() => _CombinationWidgetState();
}

class _CombinationWidgetState extends State<CombinationWidget> {

  @override
  Widget build(BuildContext context) {
    
    return MediaQuery.removePadding(

        context: context,
        removeTop: true,

        child: ListView.builder(
            shrinkWrap: true,
            itemCount: Settings.codeLength,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, position)
            {
              return GestureDetector(
                onTap: () => _modifyCode(position),
                child: new PegItem(pegModel: widget.combination[position]),
              );
            }
        )
    );

//    return ListView.builder(
//              shrinkWrap: true,
//              padding: EdgeInsets.all(0),
//              itemCount: Settings.codeLength,
//              scrollDirection: Axis.horizontal,
//              itemBuilder: (context, position)
//              {
//                return GestureDetector(
//                  onTap: () => _modifyCode(position),
//                  child: new PegItem(pegModel: widget.combination[position]),
//                );
//              }
//    );

//    return Row(
//      mainAxisSize: MainAxisSize.min,
//      children: [
//        Expanded(
//          child: IconButton(icon: new Icon(Icons.favorite_border, size: 45,),),
////          child: ListView.builder(
////              shrinkWrap: true,
////              itemCount: Settings.codeLength,
////              scrollDirection: Axis.horizontal,
////              itemBuilder: (context, position)
////              {
////                return GestureDetector(
////                  onTap: () => _modifyCode(position),
////                  child: new PegItem(pegModel: widget.combination[position]),
////                );
////              }
////          ),
//        )
//      ],
//    );
  }

  void _modifyCode(int position)
  {
    setState(()
    {
      MastermindModel.modifyCode(widget.combination, position);
    });
  }

}