import 'package:demo/core/presentation/bottomsheets/top_up/top_up_view.dart';
import 'package:flutter/material.dart';

mixin TopUpBottomSheet {
  void showTopUpBottomSheet(
    BuildContext context, {
    required ValueChanged<double> onTopUpSelected,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return TopUpView(onTopUpSelected: onTopUpSelected);
      },
    );
  }
}
