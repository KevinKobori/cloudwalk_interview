import 'package:nasa_apod_app/nasa_apod_app.dart';

mixin ILocalLoadPicturesUseCase implements ILoadPicturesUseCase {
  @override
  Future<List<PictureEntity>> loadLastTenDaysData();
  Future<void> validateLastTenDaysData();
  Future<void> saveLastTenDaysData(List<PictureEntity> pictureEntityList);
}