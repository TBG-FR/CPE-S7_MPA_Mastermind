
import 'package:flutter/material.dart';
import 'package:flutter_app/model/peg-key.model.dart';
import 'keypeg.widget.dart';

class HintsWidget extends StatefulWidget {

  final List<KeyPegModel> result;

  HintsWidget({Key key, @required this.result}) : super(key: key);

  @override
  _HintsWidgetState createState() => _HintsWidgetState();
}

class _HintsWidgetState extends State<HintsWidget> {

  @override
  Widget build(BuildContext context) {

    //return IconButton(icon: new Icon(Icons.favorite_border, size: 45,),);
    print(widget.result);
    return widget.result == null ||widget.result.isEmpty ? Container() : ListView.builder(
              shrinkWrap: true,
              itemCount: widget.result.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, position)
              {
                return GestureDetector(
                  child: new KeyPegItem(pegModel: widget.result[position]),
                );
              }
    );
  }
}