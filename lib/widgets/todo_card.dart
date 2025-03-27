import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  final Map item;
  final int index;
  final Function(String) deleteById;
  final Function(Map) navigateToEditTodoPage;
  const TodoCard(
     this.item,
    this.index, 
    this.deleteById,
    this.navigateToEditTodoPage,
    {super.key});

  @override
  Widget build(BuildContext context) {
    final id = item['_id'] as String;
    return Card(
                  child: ListTile(
                    leading: CircleAvatar(child: Text('${index + 1}')),
                    title: Text(item['title']),
                    subtitle: Text(item['description']),
                    trailing: PopupMenuButton(
                      onSelected: (value) {
                        if (value == 'edit') {
                          navigateToEditTodoPage(item);
                        } else if (value == 'delete') {
                          deleteById(id);
                        }
                      },
                      itemBuilder: (context) {
                        return [
                          PopupMenuItem(value: 'edit', child: Text('Edit')),
                          PopupMenuItem(value: 'delete', child: Text('Delete')),
                        ];
                      },
                    ),
                  ),
                );
  }
}