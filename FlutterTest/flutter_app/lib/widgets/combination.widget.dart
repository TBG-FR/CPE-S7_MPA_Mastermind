
import 'package:flutter/material.dart';
import 'package:flutter_app/model/combination.dart';
import 'package:flutter_app/model/mastermind.dart';
import 'package:flutter_app/model/settings.dart';

import 'peg.widget.dart';

class CombinationWidget extends StatefulWidget {

  final Combination combination;

  CombinationWidget({@required this.combination}) : super();

  @override
  CombinationWidgetState createState() => CombinationWidgetState();
}

class CombinationWidgetState extends State<CombinationWidget> {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListView.builder(
            shrinkWrap: true,
            itemCount: Settings.codeLength,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, position)
            {
              return GestureDetector(
                onTap: () => _modifyCode(position),
                child: new PegItem(widget.combination[position]),
              );
            }
        ),
      ],
    );
  }

  void _modifyCode(int position)
  {
    setState(()
    {
      Mastermind.modifyCode(widget.combination, position);
    });

  }

}