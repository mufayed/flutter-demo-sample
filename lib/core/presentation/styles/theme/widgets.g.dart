
//
// theme/widgets.g.dart
//

// Do not edit directly
// Generated on Sat, 27 Jul 2024 15:01:08 GMT



import 'package:demo/core/presentation/styles/theme/theme.g.dart';
import 'package:flutter/widgets.dart';





enum FigmaTextVariant {
    boldB1,
    boldB2,
    boldB3,
    boldB4,
    boldB5,
    boldB6,
    boldB7,
    regularR1,
    regularR2,
    regularR3,
    regularR4,
    regularR5,
    regularR6,
    regularR7,
}

class FigmaText extends StatelessWidget {
    
    const FigmaText.boldB1(
        this.text, {
        super.key,
        this.color,
        this.style,
    }) : variant = FigmaTextVariant.boldB1;
    
    const FigmaText.boldB2(
        this.text, {
        super.key,
        this.color,
        this.style,
    }) : variant = FigmaTextVariant.boldB2;
    
    const FigmaText.boldB3(
        this.text, {
        super.key,
        this.color,
        this.style,
    }) : variant = FigmaTextVariant.boldB3;
    
    const FigmaText.boldB4(
        this.text, {
        super.key,
        this.color,
        this.style,
    }) : variant = FigmaTextVariant.boldB4;
    
    const FigmaText.boldB5(
        this.text, {
        super.key,
        this.color,
        this.style,
    }) : variant = FigmaTextVariant.boldB5;
    
    const FigmaText.boldB6(
        this.text, {
        super.key,
        this.color,
        this.style,
    }) : variant = FigmaTextVariant.boldB6;
    
    const FigmaText.boldB7(
        this.text, {
        super.key,
        this.color,
        this.style,
    }) : variant = FigmaTextVariant.boldB7;
    
    const FigmaText.regularR1(
        this.text, {
        super.key,
        this.color,
        this.style,
    }) : variant = FigmaTextVariant.regularR1;
    
    const FigmaText.regularR2(
        this.text, {
        super.key,
        this.color,
        this.style,
    }) : variant = FigmaTextVariant.regularR2;
    
    const FigmaText.regularR3(
        this.text, {
        super.key,
        this.color,
        this.style,
    }) : variant = FigmaTextVariant.regularR3;
    
    const FigmaText.regularR4(
        this.text, {
        super.key,
        this.color,
        this.style,
    }) : variant = FigmaTextVariant.regularR4;
    
    const FigmaText.regularR5(
        this.text, {
        super.key,
        this.color,
        this.style,
    }) : variant = FigmaTextVariant.regularR5;
    
    const FigmaText.regularR6(
        this.text, {
        super.key,
        this.color,
        this.style,
    }) : variant = FigmaTextVariant.regularR6;
    
    const FigmaText.regularR7(
        this.text, {
        super.key,
        this.color,
        this.style,
    }) : variant = FigmaTextVariant.regularR7;
    
    final FigmaTextVariant variant;
    final String text;
    final Color? color;
    final TextStyle? style;

    @override
    Widget build(BuildContext context) {
        final theme = FigmaTheme.of(context);
        final style = () {
            switch(variant) {
                case FigmaTextVariant.boldB1:
                    return theme.textStyle.boldB1;
            
                case FigmaTextVariant.boldB2:
                    return theme.textStyle.boldB2;
            
                case FigmaTextVariant.boldB3:
                    return theme.textStyle.boldB3;
            
                case FigmaTextVariant.boldB4:
                    return theme.textStyle.boldB4;
            
                case FigmaTextVariant.boldB5:
                    return theme.textStyle.boldB5;
            
                case FigmaTextVariant.boldB6:
                    return theme.textStyle.boldB6;
            
                case FigmaTextVariant.boldB7:
                    return theme.textStyle.boldB7;
            
                case FigmaTextVariant.regularR1:
                    return theme.textStyle.regularR1;
            
                case FigmaTextVariant.regularR2:
                    return theme.textStyle.regularR2;
            
                case FigmaTextVariant.regularR3:
                    return theme.textStyle.regularR3;
            
                case FigmaTextVariant.regularR4:
                    return theme.textStyle.regularR4;
            
                case FigmaTextVariant.regularR5:
                    return theme.textStyle.regularR5;
            
                case FigmaTextVariant.regularR6:
                    return theme.textStyle.regularR6;
            
                case FigmaTextVariant.regularR7:
                    return theme.textStyle.regularR7;
            }
        } ();
        return Text(text, style: style.merge(this.style).copyWith(color: color));
    }
}



