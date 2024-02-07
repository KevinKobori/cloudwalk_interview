import 'package:nasa_apod_app/nasa_apod_app.dart';

class PicturesPageStateLoadingView extends StatelessWidget {
  final PicturesPagePresenter picturesPagePresenter;

  const PicturesPageStateLoadingView({
    required this.picturesPagePresenter,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: 
          //  Colors.transparent
          theme.colorScheme.background.withOpacity(0),
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        // backgroundColor: theme.colorScheme.background.withOpacity(0.6),
        // Colors.transparent,
        // backgroundColor: ColorsUtils.background,
        title: SizedBox(
          height: 32,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              OutlinedButton(
                onPressed: picturesPagePresenter.loadPictures,
                child: const Text('List all'),
              ),
              ApodGaps.medium,
              ApodDatePickerDialog(picturesPagePresenter),
            ],
          ),
        ),
      ),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
