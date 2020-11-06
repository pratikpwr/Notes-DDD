import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dartz/dartz.dart';
import 'package:note_ddd/domain/core/failures.dart';
import 'package:note_ddd/domain/core/value_objects.dart';
import 'package:note_ddd/domain/core/value_validators.dart';

@immutable
class EmailAddress extends ValueObject<String> {
  final Either<ValueFailure<String>, String> value;

  factory EmailAddress(String input) {
    assert(input != null);
    return EmailAddress._(validateEmailAddress(input));
  }

  EmailAddress._(this.value);
}

@immutable
class Password extends ValueObject<String> {
  final Either<ValueFailure<String>, String> value;

  factory Password(String input) {
    assert(input != null);
    return Password._(validatePassword(input));
  }

  Password._(this.value);
}

// // How to Use in UI for validation
// void showEmailAddressOrFailure() {
//   final email = EmailAddress('password');
//
//   String emailText = email.value
//       .fold((l) => 'Failure Happened , more precisely: $l', (r) => r);
//
//   String emailText2 = email.value.getOrElse(() => 'Some Failure happened.');
// }
