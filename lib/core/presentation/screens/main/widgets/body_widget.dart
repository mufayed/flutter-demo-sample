import 'package:demo/core/presentation/screens/main/widgets/list/top_up/top_up_history_list.dart';
import 'package:demo/core/presentation/screens/main/widgets/tabs_widget.dart';
import 'package:demo/core/presentation/styles/theme/widgets.g.dart';
import 'package:flutter/material.dart';

import '../../../styles/theme/theme.g.dart';
import 'list/beneficiaries/beneficiaries_list.dart';

class BodyWidget extends StatefulWidget {
  const BodyWidget({super.key});

  @override
  State<BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 16, top: 16),
            child: FigmaText.boldB3('Mobile recharge',
                color: FigmaColorData.regular().purpleIndigo),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: TextTabsWidget(
              titles: const ['Recharge', 'History'],
              onIndexChanged: (index) {
                setState(() {
                  _index = index;
                });
              },
            ),
          ),
          _index == 0 ? const BeneficiariesList() : const TopUpHistoryList(),
        ],
      ),
    );
  }
}
