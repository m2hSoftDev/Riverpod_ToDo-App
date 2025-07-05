import '../model/todo_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'todo_provider.g.dart';

@riverpod
class TodoList extends _$TodoList {
  @override
  List<Todo> build() {
    return [];
  }

void add(String title){
  final newTodo = Todo(id:Uuid().v4(), title: title, isComplete: false,);
  state = [...state, newTodo];
}

void toggle(String id) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          todo.copyWith(isComplete: !todo.isComplete)
        else
          todo
    ];
  }

  void remove(String id) {
    state = state.where((todo) => todo.id != id).toList();
  }


}