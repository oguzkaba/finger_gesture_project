import 'package:finger_gesture_project/views/widgets/custom_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyProvider myProvider = Provider.of<MyProvider>(context);
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Test App"), centerTitle: true),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              CustomTextFieldWidget(
                controller: myProvider.textFieldController,
                readOnly: true,
                enabled: false,
                hintText: "YD/\\",
              ),
              const SizedBox(height: 30),
              GestureDetector(
                onPanUpdate: myProvider.onDragUpdate,
                onPanStart: myProvider.onDragStart,
                onPanEnd: (details) => myProvider.setResultText(),
                child: Container(
                  height: size.height * .6,
                  decoration: BoxDecoration(border: Border.all()),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                  "Yukarı alanda parmağınızı yukarı, aşağı yada sağa, sola hareket ettiriniz"),
            ],
          ),
        ),
      ),
    );
  }
}
