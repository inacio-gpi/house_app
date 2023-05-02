import 'package:flutter/material.dart';

class BaseScaffold extends StatelessWidget {
  const BaseScaffold({
    Key? key,
    this.appBar,
    this.body,
  }) : super(key: key);
  final PreferredSizeWidget? appBar;
  final Widget? body;
  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: appBar,
        body: SafeArea(
          child: GestureDetector(
            // splashColor: Colors.transparent,
            // hoverColor: Colors.transparent,
            // highlightColor: Colors.transparent,
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: body,
          ),
        ),
      );
}
