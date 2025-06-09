import 'package:flutter_test/flutter_test.dart';
import 'package:training/domain/domain.dart';

void main() {
  group('MissionEntity', () {
    final name = 'Test Mission';
    final createdAt = DateTime.parse('2025-01-01T10:00:00Z');
    final endAt = DateTime.parse('2025-01-02T18:00:00Z');
    final status = MissionStatus.disponible;
    final sendingCount = 5;

    group('constructor', () {
      test('should create a Mission object with valid values', () {
        final mission = Mission(
          name: name,
          createdAt: createdAt,
          endAt: endAt,
          status: status,
          sendingCount: sendingCount,
        );

        expect(mission.name, name);
        expect(mission.createdAt, createdAt);
        expect(mission.endAt, endAt);
        expect(mission.status, status);
        expect(mission.sendingCount, sendingCount);
      });
    });

    group('equality', () {
      test('should be equal with another Mission with same values', () {
        final m1 = Mission(
          name: name,
          createdAt: createdAt,
          endAt: endAt,
          status: status,
          sendingCount: sendingCount,
        );
        final m2 = Mission(
          name: name,
          createdAt: createdAt,
          endAt: endAt,
          status: status,
          sendingCount: sendingCount,
        );
        expect(m1, m2);
      });

      test('should not be equal with different name', () {
        final m1 = Mission(
          name: name,
          createdAt: createdAt,
          endAt: endAt,
          status: status,
          sendingCount: sendingCount,
        );
        final m2 = Mission(
          name: 'Other Mission',
          createdAt: createdAt,
          endAt: endAt,
          status: status,
          sendingCount: sendingCount,
        );
        expect(m1, isNot(equals(m2)));
      });

      test('should not be equal with different createdAt', () {
        final m1 = Mission(
          name: name,
          createdAt: createdAt,
          endAt: endAt,
          status: status,
          sendingCount: sendingCount,
        );
        final m2 = Mission(
          name: name,
          createdAt: createdAt.add(const Duration(days: 1)),
          endAt: endAt,
          status: status,
          sendingCount: sendingCount,
        );
        expect(m1, isNot(equals(m2)));
      });

      test('should not be equal with different endAt', () {
        final m1 = Mission(
          name: name,
          createdAt: createdAt,
          endAt: endAt,
          status: status,
          sendingCount: sendingCount,
        );
        final m2 = Mission(
          name: name,
          createdAt: createdAt,
          endAt: endAt.add(const Duration(hours: 1)),
          status: status,
          sendingCount: sendingCount,
        );
        expect(m1, isNot(equals(m2)));
      });

      test('should not be equal with different status', () {
        final m1 = Mission(
          name: name,
          createdAt: createdAt,
          endAt: endAt,
          status: status,
          sendingCount: sendingCount,
        );
        final m2 = Mission(
          name: name,
          createdAt: createdAt,
          endAt: endAt,
          status: MissionStatus.disponible,
          sendingCount: sendingCount,
        );
        expect(m1, isNot(equals(m2)));
      });

      test('should not be equal with different sendingCount', () {
        final m1 = Mission(
          name: name,
          createdAt: createdAt,
          endAt: endAt,
          status: status,
          sendingCount: sendingCount,
        );
        final m2 = Mission(
          name: name,
          createdAt: createdAt,
          endAt: endAt,
          status: status,
          sendingCount: sendingCount + 1,
        );
        expect(m1, isNot(equals(m2)));
      });
    });

    group('copyWith', () {
      test('should update specified fields', () {
        final m = Mission(
          name: name,
          createdAt: createdAt,
          endAt: endAt,
          status: status,
          sendingCount: sendingCount,
        );
        final changed = m.copyWith(
          name: 'New Name',
          status: MissionStatus.enCours,
          sendingCount: 10,
        );
        expect(changed.name, 'New Name');
        expect(changed.status, MissionStatus.enCours);
        expect(changed.sendingCount, 10);
        expect(changed.createdAt, createdAt);
        expect(changed.endAt, endAt);
      });
    });
  });
}
