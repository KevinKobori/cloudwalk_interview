import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';
import 'package:flutter/widgets.dart';

mixin IPicturesPresenter implements Listenable {
  Stream<bool> get isLoadingStream;
  Stream<List<ApodObjectViewModel>?> get picturesStream;
  Stream<String?> get navigateToStream;
  late ValueNotifier<ApodObjectViewModel?> pictureFound;
  Future<void> loadData();
  Future<void> searchPictureByDate(ApodDate date);
  void goToPictureDetails(String pictureDate,
      {required ApodObjectViewModel pictureViewModel});
  void dispose();
}
