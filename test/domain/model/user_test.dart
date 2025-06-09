import 'package:flutter_test/flutter_test.dart';
import 'package:training/domain/domain.dart';

void main() {
  group('UserEntity', () {
    final fullName = 'John Doe';
    final dob = DateTime(1990, 1, 1);
    final phoneNo = '+123456789';

    group('constructor', () {
      test('should create a User with correct values', () {
        final user = User(
          fullName: fullName,
          dob: dob,
          phoneNo: phoneNo,
        );

        expect(user.fullName, fullName);
        expect(user.dob, dob);
        expect(user.phoneNo, phoneNo);
      });
    });

    group('equality', () {
      test('should be equal when all fields match', () {
        final u1 = User(
          fullName: fullName,
          dob: dob,
          phoneNo: phoneNo,
        );
        final u2 = User(
          fullName: fullName,
          dob: dob,
          phoneNo: phoneNo,
        );
        expect(u1, equals(u2));
      });

      test('should not be equal when fullName differs', () {
        final u1 = User(
          fullName: fullName,
          dob: dob,
          phoneNo: phoneNo,
        );
        final u2 = User(
          fullName: 'Jane Doe',
          dob: dob,
          phoneNo: phoneNo,
        );
        expect(u1, isNot(equals(u2)));
      });

      test('should not be equal when dob differs', () {
        final u1 = User(
          fullName: fullName,
          dob: dob,
          phoneNo: phoneNo,
        );
        final u2 = User(
          fullName: fullName,
          dob: null,
          phoneNo: phoneNo,
        );
        expect(u1, isNot(equals(u2)));
      });

      test('should not be equal when phoneNo differs', () {
        final u1 = User(
          fullName: fullName,
          dob: dob,
          phoneNo: phoneNo,
        );
        final u2 = User(
          fullName: fullName,
          dob: dob,
          phoneNo: '+987654321',
        );
        expect(u1, isNot(equals(u2)));
      });
    });

    group('serialization', () {
      test('should serialize to JSON correctly', () {
        final user = User(
          fullName: fullName,
          dob: dob,
          phoneNo: phoneNo,
        );
        final json = user.toJson();

        expect(json['fullName'], fullName);
        expect(json['dob'], dob.toIso8601String());
        expect(json['phoneNo'], phoneNo);
      });

      test('should deserialize from JSON correctly', () {
        final json = {
          'fullName': fullName,
          'dob': dob.toIso8601String(),
          'phoneNo': phoneNo,
        };
        final user = User.fromJson(json);

        expect(user.fullName, fullName);
        expect(user.dob, dob);
        expect(user.phoneNo, phoneNo);
      });
    });
  });
}
