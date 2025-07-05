import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Provider/todo_provider.dart' show todoListProvider;

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoListProvider);

    final controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Riverpod ToDo')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      hintText: 'Enter task',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    if (controller.text.trim().isNotEmpty) {
                      ref.read(todoListProvider.notifier).add(controller.text);
                      controller.clear();
                    }
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return ListTile(
                  title: Text(
                    todo.title,
                    style: TextStyle(
                      decoration: todo.isComplete
                          ? TextDecoration.lineThrough
                          : null,
                    ),
                  ),
                  leading: Checkbox(
                    value: todo.isComplete,
                    onChanged: (_) =>
                        ref.read(todoListProvider.notifier).toggle(todo.id),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () =>
                        ref.read(todoListProvider.notifier).remove(todo.id),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
