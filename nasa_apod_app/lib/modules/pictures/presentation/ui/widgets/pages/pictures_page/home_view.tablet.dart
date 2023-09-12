// import 'package:flutter/material.dart';
// import 'package:nasa_apod_app/nasa_apod_app.dart';
// import 'package:nasa_apod_app/ui/common/app_colors.dart';
// import 'package:nasa_apod_app/ui/common/ui_helpers.dart';
// import 'package:stacked/stacked.dart';

// class PicturesPageTablet extends ViewModelWidget<IPicturesPresenter> {
//   const PicturesPageTablet({super.key});

//   @override
//   Widget build(BuildContext context, IPicturesPresenter viewModel) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 25.0),
//           child: Center(
//             child: Column(
//               mainAxisSize: MainAxisSize.max,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 verticalSpaceLarge,
//                 Column(
//                   children: [
//                     const Text(
//                       'Hello, TABLET UI!',
//                       style: TextStyle(
//                         fontSize: 35,
//                         fontWeight: FontWeight.w900,
//                       ),
//                     ),
//                     verticalSpaceMedium,
//                     MaterialButton(
//                       color: Colors.black,
//                       onPressed: viewModel.incrementCounter,
//                       child: Text(
//                         viewModel.counterLabel,
//                         style: const TextStyle(color: Colors.white),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     MaterialButton(
//                       color: kcDarkGreyColor,
//                       onPressed: viewModel.showDialog,
//                       child: const Text(
//                         'Show Dialog',
//                         style: TextStyle(
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                     MaterialButton(
//                       color: kcDarkGreyColor,
//                       onPressed: viewModel.showBottomSheet,
//                       child: const Text(
//                         'Show Bottom Sheet',
//                         style: TextStyle(
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:provider/provider.dart';

class PicturesPageTablet extends StatelessWidget {
  final IPicturesPresenter picturesPresenter;

  const PicturesPageTablet({ required this.picturesPresenter, super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<PictureViewModel>?>(
      stream: picturesPresenter.picturesStream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return ReloadScreen(
            error: '${snapshot.error}',
            reload: picturesPresenter.loadPictures,
          );
        }
        if (snapshot.hasData) {
          return ListenableProvider(
            create: (_) => picturesPresenter,
            child: ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return PictureTile(
                  picturesPresenter: picturesPresenter,
                  pictureViewModel: snapshot.data![index],
                );
              },
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
