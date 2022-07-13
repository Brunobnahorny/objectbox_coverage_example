import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:objectbox_coverage_example/db_datasource.dart';
import 'package:objectbox_coverage_example/entity_example.dart';

import 'mock_store.dart';

void main() {
  late DbDatasource dbDatasource;

  setUp(() {
    final db = MockStore.setUpDbStore();
    dbDatasource = DbDatasource(db);
  });

  test('getAllEntities', () {
    //assert
    final clearEntitiesList = dbDatasource.getAllEntities();
    final entity = EntityExample(
      0,
      'testExample${UniqueKey().toString()}',
    );
    dbDatasource.saveEntity(entity);
    final entitiesList = dbDatasource.getAllEntities();
    //assert

    expect(clearEntitiesList, isA<List<EntityExample>>());
    expect(clearEntitiesList.length, equals(0));
    expect(entitiesList, isA<List<EntityExample>>());
    expect(entitiesList.length, equals(1));
    expect(entitiesList[0].test, isNotNull);
  });

  tearDown(() {
    MockStore.tearDown();
  });
}
