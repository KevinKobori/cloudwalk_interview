import 'package:nasa_apod_app/nasa_apod_app.dart';

class ApodReloadPage extends StatelessWidget {
  final String error;
  final void Function() reload;

  const ApodReloadPage({required this.error, required this.reload, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(error,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center),
          KAppGaps.small,
          ElevatedButton(
            onPressed: reload,
            child: Text(I18n.strings.reload),
          )
        ],
      ),
    );
  }
}
