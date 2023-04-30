import 'package:flutter/material.dart';

abstract class BasePage<MyController> {
  // const BasePage({super.key});

  @protected
  PreferredSizeWidget? appBar(final BuildContext context) => null;

  @protected
  Widget body(final BuildContext context);

  @protected
  Widget? bottomNavigationBar(final BuildContext context) => null;

  @override
  Widget build(final BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: appBar(context),
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: body(context),
          ),
        ),
        bottomNavigationBar: bottomNavigationBar(context),
      );
}
