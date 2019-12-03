
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/model/mastermind.model.dart';
import 'try.widget.dart';

class TriesWidget extends StatefulWidget {

  final MastermindModel mastermind;

  TriesWidget({Key key, @required this.mastermind}) : super(key: key);

  @override
  _TriesWidgetState createState() => _TriesWidgetState();
}

class _TriesWidgetState extends State<TriesWidget>
{

  ScrollController _scrollController;
  int localTriesCount = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    Timer.periodic(Duration(milliseconds: 100), (timer) {
      if (mounted ) {
        if (localTriesCount != widget.mastermind.tries.length) {
          localTriesCount = widget.mastermind.tries.length;
          _scrollToBottom();
        }
      } else {
        timer.cancel();
      }
    });
  }

  void _scrollToBottom() {

    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      child: ListView.builder(
          itemCount: widget.mastermind.tries.length,
          shrinkWrap: true,
          controller: _scrollController,
          //         padding: const EdgeInsets.all(1.0),
          itemBuilder: (BuildContext context, int index) {
            return new TryWidget(
              tryModel: widget.mastermind.tries.elementAt(index),
            );
          }
      ),
    );
  }

}