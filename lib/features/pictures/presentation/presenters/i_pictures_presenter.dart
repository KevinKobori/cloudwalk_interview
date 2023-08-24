import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';
import 'package:flutter/widgets.dart';

mixin IPicturesPresenter implements Listenable {
  Stream<bool> get isLoadingStream;
  Stream<List<PictureViewModel>?> get picturesStream;
  Stream<String?> get navigateToStream;
  late ValueNotifier<PictureViewModel?> pictureFound;
  Future<void> loadData();
  Future<void> searchPictureByDate(String date);
  void goToPictureDetails(String pictureDate);
  void dispose();
}
