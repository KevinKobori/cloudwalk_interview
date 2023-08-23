import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';
import 'package:mocktail/mocktail.dart';

class LocalStorageSpy extends Mock implements ILocalStorage {
  LocalStorageSpy() {
    mockDelete();
    mockSave();
  }

  When<dynamic> mockFetchCall() => when(() => fetch(any()));
  void mockFetch(dynamic json) => mockFetchCall().thenAnswer((_) async => json);
  void mockFetchError() => mockFetchCall().thenThrow(Exception());

  When<dynamic> mockDeleteCall() => when(() => delete(any()));
  void mockDelete() => mockDeleteCall().thenAnswer((_) async => _);
  void mockDeleteError() => mockDeleteCall().thenThrow(Exception());

  When<Future<void>> mockSaveCall() => when(
      () => save(key: any(named: 'key'), value: any<dynamic>(named: 'value')));
  void mockSave() => mockSaveCall().thenAnswer((_) async => _);
  void mockSaveError() => mockSaveCall().thenThrow(Exception());
}
