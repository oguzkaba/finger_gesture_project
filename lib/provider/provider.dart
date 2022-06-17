import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  TextEditingController textFieldController = TextEditingController();
  double startX = 0;
  double startY = 0;
  double updateX = 0;
  double updateY = 0;
  late Velocity endXY;

  void onDragStart(DragStartDetails details) {
    startX = details.localPosition.dx;
    startY = details.localPosition.dy;
    notifyListeners();
  }

  void onDragUpdate(DragUpdateDetails details) {
    updateX = 0;
    updateY = 0;
    updateY = details.delta.dy;
    updateX = details.delta.dx;
    notifyListeners();
  }

  void setResultText() {
    textFieldController.clear();

    if (updateX.abs() == updateY.abs() ||
        //Çapraz olanların görülmesi açısından eşitlik dışında sorguya hassasiyet eklendi...
        (updateX.abs() - updateY.abs()).abs() < 1) {
      if (updateX > 0 && updateY > 0) {
        textFieldController.text = "\\";
      } else if (updateX < 0 && updateY > 0) {
        textFieldController.text = "/";
      } else {
        if (updateY.abs() > updateX.abs()) {
          textFieldController.text = "D";
        } else {
          textFieldController.text = "Y";
        }
      }
    } else if (updateY.abs() > updateX.abs()) {
      textFieldController.text = "D";
    } else {
      textFieldController.text = "Y";
    }
    notifyListeners();
  }
}
