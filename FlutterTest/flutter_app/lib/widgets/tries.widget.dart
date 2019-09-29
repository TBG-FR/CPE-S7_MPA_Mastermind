
import 'package:flutter/material.dart';
import 'package:flutter_app/model/mastermind.dart';
import 'try.widget.dart';

//class TriesWidget extends StatefulWidget {
//
//  final Combination tries;
//
//  TriesWidget({@required this.tries}) : super();
//
//  @override
//  TriesWidgetState createState() => TriesWidgetState();
//}
//
//class TriesWidgetState extends State<TriesWidget> {
//
//  @override
//  Widget build(BuildContext context) {
//    return Row(
//      mainAxisSize: MainAxisSize.min,
//      children: [
//        ListView.builder(
//            shrinkWrap: true,
//            itemCount: Settings.codeLength,
//            scrollDirection: Axis.horizontal,
//            itemBuilder: (context, position)
//            {
//              return GestureDetector(
//                onTap: () => _modifyCode(position),
//                child: new PegItem(widget.tries[position]),
//              );
//            }
//        ),
//      ],
//    );
//  }
//
//  void _modifyCode(int position)
//  {
//    setState(()
//    {
//      Mastermind.modifyCode(widget.combination, position);
//    });
//
//  }
//
//}

class TriesWidget extends StatefulWidget {

  final Mastermind mastermind;// = new Mastermind();

  TriesWidget({Key key, @required this.mastermind}) : super(key: key);

  @override
  _TriesWidgetState createState() => _TriesWidgetState();
}

class _TriesWidgetState extends State<TriesWidget> {

  void _handleButtonPressed(bool newValue) {
    setState(() {
      widget.mastermind.checkLastTry();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TryWidget(
        tryModel: widget.mastermind.tries.last,
        onChanged: _handleButtonPressed,
      ),
    );
  }
}