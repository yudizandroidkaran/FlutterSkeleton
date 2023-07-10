import 'package:hive/hive.dart';

import '../utils/storage_constants.dart';

/*Local storage service where in you can store different data in key value pairs
It contains the operator functions through which you will be able to set and get data for same key*/
class StorageService {
  final _box = Hive.box(box);

  bool hasData(String key) => _box.containsKey(key);

  bool get isFirstTimeUser {
    return _box.get(isFirstTimeUserKey) ?? true;
  }

  set isFirstTimeUser(bool value) {
    _box.put(isFirstTimeUserKey, value);
  }

  //Clear all data from local storage
  clear() async => await _box.clear();

  //Remove data for single key from local storage
  remove(String key) async => await _box.delete(key);
}
