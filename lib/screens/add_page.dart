
import 'package:flutter/material.dart';
import 'package:to_do_app/services/todo_services.dart';
import 'package:to_do_app/utils/snackbar_helpers.dart';

class AddPage extends StatefulWidget {
  final Map ? todo;
  const AddPage( {super.key, this.todo}) ;

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool isEdit = false;

  @override
  void initState() {
    super.initState();
    if (widget.todo != null) {
      isEdit = true;
      titleController.text = widget.todo!['title'] as String;
      descriptionController.text = widget.todo!['description'] as String;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        title: Center(child:  Text(
          isEdit? 'Edit Todo' : 'Add Todo',
          )),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(
              labelText: 'Title',
              contentPadding: EdgeInsets.all(20),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: descriptionController,
            decoration: const InputDecoration(
              labelText: 'Description',
              contentPadding: EdgeInsets.all(20),
            ),
            minLines: 4,
            maxLines: 9,
            keyboardType: TextInputType.multiline,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
            ),
            onPressed: isEdit? updateTodo : submitTodo, child:  Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              isEdit? 'Update' : 'Submit',style: TextStyle(fontSize: 25),),
          )),
        ],
      ),
    );
  }

  Future<void> updateTodo() async {
    final todo = widget.todo;
    if (todo == null) {
      // ignore: avoid_print
      print('You cannot update call updated without todo data');
      return;
    }
    final id = todo['_id'] as String;
    
    
    final isSuccess = await TodoServices.updateTodo(id, body);

    if (isSuccess) {
      // ignore: use_build_context_synchronously
      showSuccessMessage(context, Message: 'Todo updated successfully');
    } else {
      // ignore: use_build_context_synchronously
      showErrorMessage(context, Message: 'Failed to update todo');
    }
  }

  Future<void> submitTodo() async {
   
    // Add the code to send the data to the server
    // and handle the response
    
    final isSuccess = await TodoServices.submitTodo(body);

    if (isSuccess) {
      titleController.text = '';
      descriptionController.text = '';
      // ignore: use_build_context_synchronously
      showSuccessMessage( context, Message: 'successfully added todo');
    } else {
      // ignore: use_build_context_synchronously
      showErrorMessage(context, Message: 'Failed to add todo');
      
    }
  }

  Map get body {
     final title = titleController.text;
    final description = descriptionController.text;
    return {
      "title": title,
      "description": description,
      "is_completed": false,
    };
  }

 
}
