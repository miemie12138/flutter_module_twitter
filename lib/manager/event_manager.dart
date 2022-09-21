import 'package:rxdart/rxdart.dart';

class EventManager {
  EventManager._();

  /// 语言切换
  static PublishSubject<bool> languageChangeNotifaction = PublishSubject();
}
