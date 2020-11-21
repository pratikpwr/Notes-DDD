import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:note_ddd/domain/core/errors.dart';
import 'failures.dart';

@immutable
abstract class ValueObject<T> {
  ValueObject();

  Either<ValueFailure<T>, T> get value;

  /// throws [UnexpectedValueError] containing the [ValueFailure]
  T getOrCrash() {
    // id = identity - same as writing (r) => r
    return value.fold((l) => throw UnexpectedValueError(l), id);
  }

  bool isValid() => value.isRight();

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
