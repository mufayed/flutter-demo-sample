
//
// theme/theme.g.dart
//

// Do not edit directly
// Generated on Sat, 27 Jul 2024 15:01:08 GMT



import 'package:flutter/widgets.dart';


part 'data.g.dart';

class FigmaTheme extends InheritedWidget {
    const FigmaTheme({
      super.key,
      required this.data,
      required super.child,
    });

    final FigmaThemeData data;

    static FigmaThemeData of(BuildContext context) {
      return context.dependOnInheritedWidgetOfExactType<FigmaTheme>()?.data ?? FigmaThemeData.regular();
    }

    @override
    bool updateShouldNotify(covariant FigmaTheme oldWidget) {
      return oldWidget.data != data;
    }
}