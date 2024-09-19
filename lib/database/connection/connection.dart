import 'package:drift/drift.dart';

import 'unsupported.dart'
    if (dart.library.js) 'web.dart'
    if (dart.library.ffi) 'app.dart';

class DBCreator {
  static QueryExecutor createDatabaseConnection() => connectOnDB();
}
