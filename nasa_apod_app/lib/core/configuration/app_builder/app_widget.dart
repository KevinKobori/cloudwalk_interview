import 'package:nasa_apod_app/nasa_apod_app.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBuilder(
      title: 'Nasa Apod App',
      theme: kThemeData,
      themeSizes: kAppThemeSizesData,
    );
  }
}
