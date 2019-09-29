
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/combination.widget.dart';
import 'package:flutter_app/widgets/peg.widget.dart';
import '../main.dart';
import '../model/mastermind.dart';
import '../model/peg.dart';
import '../model/settings.dart';

class MastermindGame extends StatefulWidget {

  final Mastermind mastermind;// = new Mastermind();

  MastermindGame({@required this.mastermind}) : super();

  @override
  MastermindGameState createState() => MastermindGameState();
}

class MastermindGameState extends State<MastermindGame> {

//  MastermindGameState() {
//    widget.mastermind.newTry();
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mastermind'),
//        actions: <Widget>
//        [
//          IconButton
//            (
//            icon: Icon(Icons.list),
//            onPressed: _pushSaved,
//          ),
//        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: CombinationWidget(combination: widget.mastermind.secretCode),),
          Expanded(child: CombinationWidget(combination: widget.mastermind.tries.last.tryCode),),
//          Expanded(
//            child: ListView.builder(
//                itemCount: Settings.codeLength,
//                scrollDirection: Axis.horizontal,
//                itemBuilder: (context, position) {
//                  return GestureDetector(
//                    onTap: () => _modifyCode(true, position),
//                    child: new PegItem(widget.mastermind.secretCode[position]),
//                  );
//                }
//            ),
//          ),
//          Expanded(
//            child: ListView.builder(
//                itemCount: Settings.codeLength,
//                scrollDirection: Axis.horizontal,
//                itemBuilder: (context, position) {
//                  return GestureDetector(
//                    onTap: () => _modifyCode(false, position),
//                    child: new PegItem(widget.mastermind.tries.last.tryCode[position]),
//                  );
//                }
//            ),
//          ),
//          Expanded(
//            child: ListView.builder(
//                itemCount: mastermind.tries.length,
//                scrollDirection: Axis.vertical,
//                itemBuilder: (context, position)
//                {
//                  return Scaffold(
//                    body: Column(
//                      children: <Widget>[
//                        Expanded(
//                          child: ListView.builder(
//                              itemCount: Settings.codeLength,
//                              scrollDirection: Axis.horizontal,
//                              itemBuilder: (context, position) {
//                                return GestureDetector(
//                                  onTap: () => _modifyCode(false, position),
//                                  child: new PegItem(
//                                      mastermind.tries.last.tryCode[position]),
//                                );
//                              }
//                          ),
//                        ),
//                      ],
//                    ),
//                  );
//                }
//            ),
//          ),
        ],
      ),
    );
  }

}

//  void _modifyCode(bool secretCode, int position)
//  {
//    setState(()
//    {
//      if(secretCode)
//      {
//        mastermind.modifyCode(mastermind.secretCode, position);
//      }
//      else
//      {
//        mastermind.modifyCode(mastermind.tries.last.tryCode, position);
//      }
//    });

  //}

//  bool _editPeg(int position, List<CodePeg> list) {
//    setState(() {
//      // This call to setState tells the Flutter framework that something has
//      // changed in this State, which causes it to rerun the build method below
//      // so that the display can reflect the updated values. If we changed
//      // _counter without calling setState(), then the build method would not be
//      // called again, and so nothing would appear to happen.
//      list.elementAt(position).color = Settings.getRandomColorDifferent(list.elementAt(position).color);
//      //mastermind.editCode(position, Colors.red);
//    });
//    return true;
//  }

//}

//class PegItem extends StatelessWidget {
//
//  final Color color;
//
//  PegItem(CodePeg codePeg) {
//
//    Peg = codePeg;
//
//  }
//
//  PegItem(KeyPeg keyPeg) {
//
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return new Container(
//      width: diameter,
//      height: diameter,
//      decoration: new BoxDecoration(
//        shape: BoxShape.circle,
//        color: color,
//      ),
//    );
//  }
//
//
//
//}

//class CombinationItem extends StatelessWidget {
//
//  final Mastermind mastermind;
//
//  CombinationItem(this.mastermind);
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body:
//      ListView.builder(
//          itemCount: Settings.codeLength,
//          scrollDirection: Axis.horizontal,
//          itemBuilder: (context, position)
//          {
//            return GestureDetector(
//              onTap: () => modifyCode(false, position),
//              child: new PegItem(mastermind.tries.last.tryCode[position]),
//            );
//          }
//      ),
//    );
//  }
//
//}
//
//class TriesItem extends StatelessWidget {
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//
//    );
//  }
//
//}