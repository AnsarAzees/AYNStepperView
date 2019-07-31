library ayn_stepper;

import 'package:flutter/material.dart';

class AYNStepperView extends StatefulWidget {
  final int count;
  final Color activeForegroundColor;
  final Color activeBackgroundColor;
  final Color deActiveForegroundColor;
  final Color deActiveBackgroundColor;
  final Function(int count) didChangeCount;

  AYNStepperView(
      {Key key,
      this.count,
      this.activeForegroundColor,
      this.didChangeCount,
      this.activeBackgroundColor,
      this.deActiveForegroundColor,
      this.deActiveBackgroundColor})
      : super(key: key);
  @override
  _AYNStepperViewState createState() => _AYNStepperViewState();
}

class _AYNStepperViewState extends State<AYNStepperView> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            new BoxShadow(
              color: Colors.black26,
              blurRadius: 5.0,
            ),
          ],
          color:
              widget.count != 0 ? widget.activeForegroundColor : Colors.white),
      height: widget.count != 0 ? 100.0 : 50.0,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: IconButton(
                icon: Icon(
                  Icons.add,
                  color: widget.count != 0 ? Colors.white : Colors.black,
                ),
                onPressed: () {
                  widget.didChangeCount(widget.count + 1);
                },
              ),
            ),
          ),
          widget.count != 0
              ? Container(
                  child: Text(widget.count.toString(),
                      style: const TextStyle(
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.w400,
                          fontFamily: "Quicksand",
                          fontStyle: FontStyle.normal,
                          fontSize: 20.0)))
              : Container(),
          widget.count != 0
              ? Expanded(
                  child: Container(
                    child: IconButton(
                        icon: Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            if (widget.count != 0) {
                              widget.didChangeCount(widget.count - 1);
                            }
                          });
                        }),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
