import 'dart:io';

import 'package:objectbox_coverage_example/objectbox.g.dart';

final _ps = Platform.pathSeparator;
final _testPath = '${Directory.current.path}${_ps}test${_ps}objectbox';

class MockStore {
  ///Create a local db to test
  ///Atention: do not work properly on Apple M1 Processors
  static Store? store;
  static Store setUpDbStore() {
    tearDown();

    final dir = Directory(_testPath);

    if (!dir.existsSync()) dir.createSync();

    store ??= Store(
      getObjectBoxModel(),
      directory: _testPath,
    );

    return store!;
  }

  static void tearDown() async {
    //close pending store
    store?.close();

    //set null in static field to garbage collect Store instance
    store = null;

    final dir = Directory(_testPath);
    //remove database data
    if (dir.existsSync()) dir.deleteSync(recursive: true);
  }
}
