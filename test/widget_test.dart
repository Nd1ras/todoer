import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hivedb/home_screen.dart';
import 'package:hivedb/todo.dart';

void main() {
  setUp(() async {
    Hive.init('./test_hive');
    Hive.registerAdapter(TodoAdapter());
    await Hive.openBox<Todo>('todo');
  });

  tearDown(() async {
    await Hive.box<Todo>('todo').clear();
    await Hive.close();
  });

  testWidgets('HomeScreen shows empty state', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: HomeScreen()),
    );

    expect(find.text('Tasks Completed!'), findsOneWidget);
    expect(find.text('ToDoer'), findsOneWidget);
  });
}
