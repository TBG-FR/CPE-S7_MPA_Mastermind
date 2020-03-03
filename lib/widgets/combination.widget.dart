
import 'package:flutter/material.dart';
import 'package:flutter_app/model/combination.model.dart';
import 'package:flutter_app/model/mastermind.model.dart';
import 'package:flutter_app/utils/settings.utils.dart';
import 'peg.widget.dart';

class CombinationWidget extends StatefulWidget {

  final CombinationModel combination;
  final double pegSize;

  CombinationWidget({Key key, @required this.combination, this.pegSize = 50}) : super(key: key);

  @override
  _CombinationWidgetState createState() => _CombinationWidgetState();
}

class _CombinationWidgetState extends State<CombinationWidget> {

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
            child: ListView.builder
              (
                shrinkWrap: true,
                itemCount: Settings.codeLength,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, position)
                {
                  if(widget.combination.editable)
                  {
                    return GestureDetector(
                      onTap: () => _modifyCode(position),
                      child: new PegItem(pegModel: widget.combination.pegs[position], pegSize: widget.pegSize,),
                    );
                  }
                  else return new PegItem(pegModel: widget.combination.pegs[position], pegSize: widget.pegSize,);
                }
            )
        ),
    );
  }

  void _modifyCode(int position)
  {
    setState(()
    {
      MastermindModel.modifyCode(widget.combination, position);
    });
  }

}