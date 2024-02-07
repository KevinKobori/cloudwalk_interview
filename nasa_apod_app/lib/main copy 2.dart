import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

/// Extensão de tema para estilizar quadrados.
class SquareStyle extends ThemeExtension<SquareStyle> {
  const SquareStyle({this.color, this.size, this.borderRadius});

  final Color? color;
  final double? size;
  final double? borderRadius;

  @override
  ThemeExtension<SquareStyle> lerp(
      ThemeExtension<SquareStyle>? other, double t) {
    if (other is! SquareStyle) {
      return this;
    }
    final double defaultSize = size ?? 100;
    final double defaultBorderRadius = borderRadius ?? 0;
    return SquareStyle(
      color: Color.lerp(color, other.color, t),
      size: other.size != null
          ? ((other.size! - defaultSize) * t) + defaultSize
          : size,
      borderRadius: other.borderRadius != null
          ? ((other.borderRadius! - defaultBorderRadius) * t) +
              defaultBorderRadius
          : borderRadius,
    );
  }

  @override
  SquareStyle copyWith({Color? color, double? size, double? borderRadius}) {
    return SquareStyle(
      color: color ?? this.color,
      size: size ?? this.size,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }

  @override
  String toString() =>
      'SquareStyle(color: $color, size: $size, borderRadius: $borderRadius)';
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Color> _middleBlockColors = [Colors.blue, Colors.orange];
  final List<double> _middleBlockSizes = [150, 100];
  final List<double> _borderRadiuses = [10, 0];
  int _stylesIndex = 0;

  void _toggleStyle() {
    setState(() => _stylesIndex = _stylesIndex == 0 ? 1 : 0);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        extensions: <ThemeExtension<dynamic>>[
          SquareStyle(
            color: _middleBlockColors[_stylesIndex],
            size: _middleBlockSizes[_stylesIndex],
            borderRadius: _borderRadiuses[_stylesIndex],
          ),
        ],
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Square(),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: _toggleStyle,
                child: const Square(
                  style: SquareStyle(
                    color: Colors.red,
                    size: 100,
                  ),
                  child: Center(child: Text('Tap me!')),
                ),
              ),
              const SizedBox(height: 10),
              const Square(style: SquareStyle(color: Colors.green)),
            ],
          ),
        ),
      ),
    );
  }
}

@immutable
class Square extends StatelessWidget {
  const Square({Key? key, this.style, this.child}) : super(key: key);

  final SquareStyle? style;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final SquareStyle defaultStyle =
        Theme.of(context).extension<SquareStyle>()!;
    final double size = style?.size ?? defaultStyle.size ?? 100;
    final Color color = style?.color ?? defaultStyle.color ?? Colors.blue;
    final double borderRadius =
        style?.borderRadius ?? defaultStyle.borderRadius ?? 0;
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: child,
    );
  }
}
