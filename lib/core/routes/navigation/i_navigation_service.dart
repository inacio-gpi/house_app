abstract class INavigationService {
  Future<T?>? toNamed<T>(final String path, {final dynamic arguments});
  Future<T?>? offAllNamed<T>(final String path, {final dynamic arguments});
  void back<T>({final T? result});
}
