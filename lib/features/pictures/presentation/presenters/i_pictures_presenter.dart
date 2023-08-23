import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';
import 'package:flutter/widgets.dart';

abstract class IPicturesPresenter implements Listenable {
  Stream<bool> get isLoadingStream;
  Stream<List<PictureViewModel>?> get picturesStream;
  Stream<String?> get navigateToStream;

  Future<void> loadData();
  void goToPictureDetails(String pictureDate);
  void dispose();
}
