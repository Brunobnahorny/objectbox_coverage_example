import 'package:objectbox/objectbox.dart';

@Entity()
class EntityExample {
  int id;
  final String test;

  EntityExample(
    this.id,
    this.test,
  );
}
