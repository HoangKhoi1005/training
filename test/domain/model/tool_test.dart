import 'package:flutter_test/flutter_test.dart';
import 'package:training/domain/domain.dart';

void main() {
  group('ToolEntity', () {
    final title = 'Test Tool';
    final iconPath = 'assets/icons/tool.png';

    group('constructor', () {
      test('should create a Tool with correct values', () {
        final tool = Tool(
          title: title,
          iconPath: iconPath,
        );

        expect(tool.title, title);
        expect(tool.iconPath, iconPath);
      });
    });

    group('equality', () {
      test('should be equal when title and iconPath are the same', () {
        final t1 = Tool(title: title, iconPath: iconPath);
        final t2 = Tool(title: title, iconPath: iconPath);

        expect(t1, equals(t2));
      });

      test('should not be equal when title differs', () {
        final t1 = Tool(title: title, iconPath: iconPath);
        final t2 = Tool(title: 'Other Tool', iconPath: iconPath);

        expect(t1, isNot(equals(t2)));
      });

      test('should not be equal when iconPath differs', () {
        final t1 = Tool(title: title, iconPath: iconPath);
        final t2 = Tool(title: title, iconPath: 'assets/icons/other.png');

        expect(t1, isNot(equals(t2)));
      });
    });

    group('serialization', () {
      test('should serialize to JSON correctly', () {
        final tool = Tool(title: title, iconPath: iconPath);
        final json = tool.toJson();

        expect(json['title'], title);
        expect(json['iconPath'], iconPath);
      });

      test('should deserialize from JSON correctly', () {
        final json = {'title': title, 'iconPath': iconPath};
        final tool = Tool.fromJson(json);

        expect(tool.title, title);
        expect(tool.iconPath, iconPath);
      });
    });
  });
}
