import 'package:nasa_apod_app/nasa_apod_app.dart';

class PicturesPageStateLoadSuccessView extends StatelessWidget {
  final PicturesPagePresenter picturesPagePresenter;
  final List<PictureViewModel>? pictureViewModelList;

  const PicturesPageStateLoadSuccessView({
    required this.picturesPagePresenter,
    required this.pictureViewModelList,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      // backgroundColor:
      //     //  Colors.transparent
      //     theme.colorScheme.background.withOpacity(0),
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
      body: Center(
        child: ListView.builder(
          itemCount: pictureViewModelList?.length ?? 0,
          itemBuilder: (context, index) {
            return XPadding(
              padding: const XEdgeInsets.symmetric(
                horizontal: XSpacingSize.medium,
                vertical: XSpacingSize.small,
              ),
              // ApodEdgeInsets.allMedium,
              // Theme.of(context).data.spacings.large.toInsets(),
              child: ApodPicturesListTile(
                picturesPagePresenter: picturesPagePresenter,
                pictureViewModel: pictureViewModelList![index],
              ),
            );
            // return Icon(Theme.of(context).data.)
          },
        ),
      ),
    );
  }
}
