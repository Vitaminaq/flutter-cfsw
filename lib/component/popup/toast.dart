import 'package:flutter/material.dart';

Function(BuildContext context, String msg) toast =
    (BuildContext context, String msg) {
  return createOverlay(context, msg);
};

class ToastWidget extends StatelessWidget {
  final String msg;

  const ToastWidget({Key key, @required this.msg})
      : assert(msg != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Align(
          alignment: Alignment.center,
          child: Opacity(
            opacity: 0.6,
            child: Container(
              padding: EdgeInsets.only(
                  top: 4.0, bottom: 4.0, left: 12.0, right: 12.0),
              decoration: BoxDecoration(
                color: Color(0xff000000),
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
              ),
              child: Text(
                msg,
                style: TextStyle(color: Color(0xffffffff)),
              ),
            ),
          )),
    );
  }
}

Function(BuildContext context, String msg) createOverlay =
    (BuildContext context, String msg) {
  final OverlayState overlayState = Overlay.of(context);

  OverlayEntry _overlayEntry = OverlayEntry(
      builder: (BuildContext context) => ToastWidget(
            msg: msg,
          ));

  overlayState.insert(_overlayEntry);
  Future.delayed(Duration(milliseconds: 1000), () {
    _overlayEntry.remove();
  });
};
