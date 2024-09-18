import 'package:drift/drift.dart';
import 'package:river_pod/database/connection/unsupported.dart';

export 'unsupported.dart'
if (dart.library.js) 'web.dart'
if (dart.library.ffi) 'app.dart';


class DBCreator {
  static QueryExecutor createDatabaseConnection() =>
      connectOnDB();
}
