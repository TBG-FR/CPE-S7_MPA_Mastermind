
import 'dart:math';
import 'package:flutter/material.dart';
import 'main.dart';
import 'model/mastermind.dart';
import 'model/peg.dart';
import 'model/settings.dart';

class MastermindGame extends StatefulWidget {
  @override
  MastermindGameState createState() => MastermindGameState();
}

class MastermindGameState extends State<MastermindGame> {

  Mastermind mastermind = new Mastermind();

  MastermindGameState()
  {
    mastermind.newTry();
  }

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
          Expanded(
            child: ListView.builder(
                itemCount: Settings.codeLength,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, position)
                {
                  return GestureDetector(
                    onTap: () => _modifyCode(true, position),
                    child: new PegItem(mastermind.secretCode[position]),
                  );
                }
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: Settings.codeLength,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, position)
                {
                  return GestureDetector(
                    onTap: () => _modifyCode(false, position),
                    child: new PegItem(mastermind.tries.last.tryCode[position]),
                  );
                }
                ),
          ),
//          Expanded(
//            child: ListView.builder(itemCount: Mastermind.codeLength,
//                scrollDirection: Axis.horizontal,
//                itemBuilder: (context, position)
//                {
//                  return ListTile(
//                    leading: new PegItem(mastermind.secretCode[position]),
//                    //title: Text('${items[position].title}'),
//                    //subtitle: Text('${items[position].body}'),
//                    onTap: () => _editPeg(position),
//                  );
//                }),
//          ),
        ],
      ),
    );
  }

  void _modifyCode(bool secretCode, int position)
  {
    setState(()
    {
      if(secretCode)
      {
        mastermind.modifyCode(mastermind.secretCode, position);
      }
      else
      {
        mastermind.modifyCode(mastermind.tries.last.tryCode, position);
      }
    });

  }

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

}

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

class PegItem extends StatelessWidget {

  final Peg peg;

  PegItem(this.peg);

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: 50,
      height: 50,
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        color: peg.color,
      ),
    );
  }
}
