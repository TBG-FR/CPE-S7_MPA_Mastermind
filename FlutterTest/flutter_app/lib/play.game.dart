
import 'package:flutter/material.dart';
import 'main.dart';
import 'model/mastermind.dart';
import 'model/mastermind.dart';

class MastermindGame extends StatefulWidget {
  @override
  MastermindGameState createState() => MastermindGameState();
}

class MastermindGameState extends State<MastermindGame> {

  Mastermind mastermind = new Mastermind();
  List<CodePeg> tryCode = List<CodePeg>(Mastermind.codeLength);

  MastermindGameState() {

    for(int i=0; i < Mastermind.codeLength; i++)
    {
      mastermind.editCode(i, Colors.blue);
      tryCode[i] = new CodePeg(); //Colors.blue
    }
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
            child: ListView.builder(itemCount: Mastermind.codeLength,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, int)
                {
                  return GestureDetector(
                    onTap: () => _editPeg(int),
                    child: new PegItem(mastermind.secretCode[int]),
                  );
                }
            ),
          ),
          Expanded(
            child: ListView.builder(itemCount: Mastermind.codeLength,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, int) { return new PegItem(tryCode[int]); }
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

  bool _editPeg(int position) {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      mastermind.editCode(position, Colors.red);
    });
    return true;
  }

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
