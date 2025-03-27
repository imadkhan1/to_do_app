
import 'package:flutter/material.dart';
import 'package:to_do_app/screens/add_page.dart';
import 'package:to_do_app/services/todo_services.dart';
import 'package:to_do_app/utils/snackbar_helpers.dart';
import 'package:to_do_app/widgets/todo_card.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key}) : super();

  @override
  State<TodoListPage> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoListPage> {
  bool isLoading = true;
  List items = [];

  @override
  void initState() {
    super.initState();
    fetchTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        title: Center(child: const Text('To-Do List')),
      ),
      body: Visibility(
        visible: isLoading,
        // ignore: sort_child_properties_last
        child: Center(child: CircularProgressIndicator()),
        replacement: RefreshIndicator(
          onRefresh: fetchTodos,
          child: Visibility(
            visible: items.isNotEmpty,
            replacement: Center(
              child: Text(
                'No todos available',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            child: ListView.builder(
              itemCount: items.length,
              padding: const EdgeInsets.all(12),
              itemBuilder: (context, index) {
                final item = items[index] as Map;
                // ignore: unused_local_variable
                final id = item['_id'] as String;
                return TodoCard(
                  item,
                  index,
                  deleteById,
                  navigateToEditTodoPage,
                );
              },
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.deepPurple,
        onPressed: navigateToAddTodoPage,
        label: const Text('Add Todo', style: TextStyle(fontSize: 18)),
      ),
    );
  }

  Future<void> fetchTodos() async {
    
    final response = await TodoServices.fetchTodos(); 
    if (response != null) {
      
      setState(() {
        items = response;
      });
    }
    else{
      // ignore: use_build_context_synchronously
      showErrorMessage(context, Message: 'Failed to fetch todos');
    }
    setState(() {
      isLoading = false;
    });
  }

 
  Future<void> navigateToAddTodoPage() async {
    final route = MaterialPageRoute(builder: (context) => const AddPage());
    await Navigator.push(context, route);
    setState(() {
      isLoading = true;
    });
    fetchTodos();
  }

  Future<void> navigateToEditTodoPage(Map item) async {
    final route = MaterialPageRoute(builder: (context) => AddPage(todo: item));
    await Navigator.push(context, route);
    setState(() {
      isLoading = true;
    });
    fetchTodos();
  }

  Future<void> deleteById(String id) async {
    final isSuccess = await TodoServices.deleteById(id);

    if (isSuccess) {
      final filteredItems = items.where((item) => item['_id'] != id).toList();
      setState(() {
        items = filteredItems;
      });
     
      // ignore: use_build_context_synchronously
      showSuccessMessage(context , Message: 'Todo deleted successfully');
    } else {
      // ignore: use_build_context_synchronously
      showErrorMessage(context, Message: 'Failed to delete todo');
    }
  }

  // ignore: non_constant_identifier_names
  
}
