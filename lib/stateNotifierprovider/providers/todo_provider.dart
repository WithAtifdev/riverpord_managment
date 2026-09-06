import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpord_management/stateNotifierprovider/model/todo.dart';

class TodoProvider extends StateNotifier<List<Todo>> {
  TodoProvider() : super([]);
 
  void addTodo(String name) {
   final todo = Todo(
      id: DateTime.now().toString(),
      name: name,
    );
    state.add(todo);
   state = state.toList();
  }

  void removeTodo(String id) {
   state.removeWhere((item) => item.id == id);
   state = state.toList();
  }

  void updateTodo(String id, String name) {
    int foundIndex = state.indexWhere((item) => item.id == id);
    state[foundIndex].name = name;
   state = state.toList();
  }
}

final todoProvider =  StateNotifierProvider<TodoProvider, List<Todo>>((ref) {
  return TodoProvider();
});