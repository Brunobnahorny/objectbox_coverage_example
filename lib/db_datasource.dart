import 'package:objectbox_coverage_example/objectbox.g.dart';

import 'entity_example.dart';

class DbDatasource {
  final Store db;

  DbDatasource(this.db);

  List<EntityExample> getAllEntities() {
    final data = db.box<EntityExample>();
    return data.getAll();
  }

  int saveEntity(EntityExample entity) {
    final data = db.box<EntityExample>();
    return data.put(entity);
  }

  bool removeEntity(int id) {
    final data = db.box<EntityExample>();
    return data.remove(id);
  }
}
