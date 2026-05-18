import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    required this.child,
    this.title,
    this.bottomNavigationBar,
    this.showBack = true,
  });

  final Widget child;
  final String? title;
  final Widget? bottomNavigationBar;
  final bool showBack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: title == null
          ? null
          : AppBar(
              title: Text(title!, style: const TextStyle(fontWeight: FontWeight.w800)),
              centerTitle: false,
              backgroundColor: AppColors.background,
              elevation: 0,
              automaticallyImplyLeading: showBack,
            ),
      bottomNavigationBar: bottomNavigationBar,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: child,
        ),
      ),
    );
  }
}
