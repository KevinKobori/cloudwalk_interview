import 'package:nasa_apod_app/nasa_apod_app.dart';

// const kAppThemeSizesData = XMetricsData();
// class XMetricsData2 extends ThemeExtension<XMetricsData2> {
//   const XMetricsData2({this.color, this.size, this.borderRadius});

//   final Color? color;
//   final double? size;
//   final double? borderRadius;

//   @override
//   ThemeExtension<XMetricsData2> lerp(
//       ThemeExtension<XMetricsData2>? other, double t) {
//     if (other is! XMetricsData2) {
//       return this;
//     }
//     final double defaultSize = size ?? 100;
//     final double defaultBorderRadius = borderRadius ?? 0;
//     return XMetricsData2(
//       color: Color.lerp(color, other.color, t),
//       size: other.size != null
//           ? ((other.size! - defaultSize) * t) + defaultSize
//           : size,
//       borderRadius: other.borderRadius != null
//           ? ((other.borderRadius! - defaultBorderRadius) * t) +
//               defaultBorderRadius
//           : borderRadius,
//     );
//   }

//   @override
//   XMetricsData2 copyWith({Color? color, double? size, double? borderRadius}) {
//     return XMetricsData2(
//       color: color ?? this.color,
//       size: size ?? this.size,
//       borderRadius: borderRadius ?? this.borderRadius,
//     );
//   }

//   @override
//   String toString() =>
//       'SquareStyle(color: $color, size: $size, borderRadius: $borderRadius)';
// }

// class HeroCardStyle extends ThemeExtension<HeroCardStyle> {
//   HeroCardStyle({required this.backgroundColor, required this.borderRadius,});

//   final Color backgroundColor;
//   final double borderRadius;

// @override
//   HeroCardStyle copyWith(
//       Color? backgroundColor,
//    double? borderRadius,
//   ) => HeroCardStyle(
// backgroundColor: backgroundColor ?? this.backgroundColor,
// borderRadius: borderRadius ?? this.borderRadius,
//   );
// }

final ThemeData kThemeData = ThemeData(
  extensions: <ThemeExtension<dynamic>>[
    XMetricsData(),
  ],
  useMaterial3: true,
  fontFamily: 'Secular_One',
  // textTheme: TextTheme(
  //   bodyLarge: ,
  //   bodyMedium: ,
  //   displayLarge: ,

  // ),
  // icons: IconsTheme(
  //   menu: ,
  //   close: ,
  //   user: ,

  // ),
  // radius: RadiusTheme(
  //   none: ,
  //   small: ,
  //   large: ,
  //   extraLarge: ,
  // ),
  // spacings: SpacingsTheme(
  //   none: ,
  //   small: ,
  //   large: ,
  //   extraLarge: ,
  // ),
  // shadows: ShadowsTheme(
  //   card: ,
  //   iconButton: ,
  //   elevatedButton: ,

  // ),
  // durations: DurationsTheme(
  //   navigationTime: Durations(milisseconds: 300),
  //   splashTime: Durations(milisseconds: 250),

  // ),
  // images: Images(
  //   logo: ,
  // ),
  // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple).copyWith(
  //   // background: Colors.black,
  // ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.black.withOpacity(0.6),
  ),
  colorScheme: ColorScheme(
    // primaryColor: Cor principal usada no app, para widgets como AppBar.
    primary: const Color(0xFF1E88E5), // Exemplo: Google Blue 600

    // primaryColorDark: Variação mais escura da cor primária.
    // primaryVariant: Color(0xFF005CB2), // Exemplo: Google Blue 800

    // accentColor: Cor de destaque para elementos interativos como botões.
    secondary: const Color(0xFF00C853), // Exemplo: Google Green

    // Não tinha equivalente direto: Variação da cor secundária/accent.
    // secondaryVariant: Color(0xFF009624), // Exemplo: Google Green 800

    // cardColor: Cor de fundo para cards.
    surface: Colors.white,

    // scaffoldBackgroundColor: Cor de fundo do Scaffold.
    background: Colors.black,

    //  const Color(0xFFE0E0E0), // Exemplo: Google Grey 300

    // errorColor: Cor para indicar erros.
    error: const Color(0xFFD32F2F), // Exemplo: Google Red

    // Não tinha equivalente direto: Cor para texto/icones sobre primary.
    onPrimary: Colors.white,

    // Não tinha equivalente direto: Cor para texto/icones sobre secondary.
    onSecondary: Colors.white,

    // Geralmente relacionado a texto sobre fundos claros/escuros.
    onSurface: Colors.black,

    // Não tinha equivalente direto: Cor para texto/icones sobre background.
    onBackground: Colors.black,

    // Não tinha equivalente direto: Cor para texto/icones sobre erros.
    onError: Colors.white,

    // brightness: Configuração geral de tema claro/escuro.
    brightness: Brightness.light,

    // Não tinha equivalente direto: Cor para containers sobre primary.
    onPrimaryContainer: const Color(0xFFBBDEFB), // Exemplo: Google Blue 100

    // Não tinha equivalente direto: Cor para containers primários.
    primaryContainer: const Color(0xFF1565C0), // Exemplo: Google Blue 700

    // Não tinha equivalente direto: Cor para containers de erro.
    errorContainer: const Color(0xFFF44336), // Exemplo: Google Red 500

    // Não tinha equivalente direto: Cor inversa de primary.
    inversePrimary: const Color(0xFFCDDC39), // Exemplo: Google Lime

    // Não tinha equivalente direto: Cor inversa de surface.
    inverseSurface: const Color(0xFF424242), // Exemplo: Google Grey 800

    // Não tinha equivalente direto: Cor para texto/icones sobre containers de erro.
    onErrorContainer: Colors.black,

    // Não tinha equivalente direto: Cor para texto/icones sobre secondary containers.
    onSecondaryContainer: const Color(0xFFA5D6A7), // Exemplo: Google Green 200

    // Não tinha equivalente direto: Variação de cor para superfícies.
    onSurfaceVariant: Colors.grey.shade500,

    // Não tinha equivalente direto.
    tertiary: const Color(0xFFFFC107), // Exemplo: Google Amber
    onInverseSurface: Colors.white,
    onTertiary: Colors.black,
    onTertiaryContainer: const Color(0xFFFFECB3), // Exemplo: Google Amber 100
    outline: const Color(0xFFBDBDBD), // Exemplo: Google Grey 400
    outlineVariant: const Color(0xFF757575), // Exemplo: Google Grey 600
    scrim: const Color(0xFF757575), // Exemplo: Google Grey 600
    secondaryContainer: const Color(0xFF66BB6A), // Exemplo: Google Green 400
    shadow: const Color(0xFFBDBDBD), // Exemplo: Google Grey 400
    surfaceTint: const Color(0xFF1E88E5), // Exemplo: Google Blue 600
    surfaceVariant: const Color(0xFFEEEEEE), // Exemplo: Google Grey 200
    tertiaryContainer: const Color(0xFFFFD54F), // Exemplo: Google Amber 300

    // Outras propriedades podem ser adicionadas conforme a necessidade do design do app.
  ),
);
