import 'package:uuid/uuid.dart';

String IDGenerator() {
  return Uuid().v4().substring(0, 8);
}