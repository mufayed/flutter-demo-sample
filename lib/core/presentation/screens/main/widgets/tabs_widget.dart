import 'package:flutter/material.dart';

import '../../../styles/theme/theme.g.dart';
import '../../../styles/theme/widgets.g.dart';

class TextTabsWidget extends StatefulWidget {
  final List<String> titles;
  final ValueChanged<int> onIndexChanged;
  final int selectedTab;

  const TextTabsWidget(
      {super.key,
      required this.titles,
      required this.onIndexChanged,
      this.selectedTab = 0});

  @override
  State<TextTabsWidget> createState() => _TextTabsWidgetState();
}

class _TextTabsWidgetState extends State<TextTabsWidget> {
  int? _currentIndex;

  @override
  void initState() {
    _currentIndex = widget.selectedTab;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: FigmaColorData.regular().neutralsAzureishWhite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(widget.titles.length, (index) {
            return _tabCell(index);
          }),
        ),
      ),
    );
  }

  Widget _tabCell(int index) {
    return Expanded(
      child: Card(
        margin: const EdgeInsets.all(3),
        color: _currentIndex == index
            ? FigmaColorData.regular().neutralsWhite
            : FigmaColorData.regular().neutralsAzureishWhite,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        elevation: 0,
        child: InkWell(
            customBorder:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            onTap: () {
              if (_currentIndex != index) {
                widget.onIndexChanged(index);
                setState(() {
                  _currentIndex = index;
                });
              }
            },
            child: Center(
                child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: FigmaText.boldB6(widget.titles[index],
                  color: _currentIndex == index
                      ? FigmaColorData.regular().purpleIndigo
                      : FigmaColorData.regular().neutralsSlateGray),
            ))),
      ),
    );
  }
}
