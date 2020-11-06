

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:note_ddd/domain/auth/value_objects.dart';

@immutable
abstract class ValueObject<T> {
  ValueObject();
  Either<ValueFailure<T>, T> get value;


  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ValueObject && other.value == value;
  }

  @override
  String toString() => 'Value($value)';

  @override
  int get hashCode => value.hashCode;
}