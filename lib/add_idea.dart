import 'package:flutter/material.dart';
import 'package:ideas_app/idea.dart';

import 'category.dart';

class AddIdea extends StatefulWidget {
  const AddIdea({super.key, required this.onAddIdea});

  final void Function(Idea idea) onAddIdea;

  @override
  State<AddIdea> createState() {
    return _AddIdeaState();
  }
}

class _AddIdeaState extends State<AddIdea> {
  final Category categoryData = Category(id: [], name: ['Work', 'Study']);

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  String? _selectedCategory;

  @override
  void initState() {
    super.initState();
    _selectedCategory = categoryData.name[0];
  }

  void _submitData() {
    final enteredTitle = titleController.text;
    final enteredDescription = descriptionController.text;

    if (enteredTitle.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Enter a Title'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Okay'),
            ),
          ],
        ),
      );
      return;
    }
    widget.onAddIdea(
      Idea(
        title: enteredTitle,
        description: enteredDescription,
        category: _selectedCategory!,
      ),
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 60, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: titleController,
              maxLength: 50,
              decoration: const InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: descriptionController,
              minLines: 3,
              maxLines: 5,
              maxLength: 1000,
              decoration: const InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),

            const SizedBox(height: 15),

            Row(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: Color.fromARGB(255, 209, 234, 255),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        icon: const Icon(Icons.arrow_drop_down_rounded),
                        iconSize: 30,
                        dropdownColor: const Color.fromARGB(255, 223, 241, 255),
                        items: categoryData.name
                            .map(
                              (category) => DropdownMenuItem(
                                value: category,
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Text(category),
                                ),
                              ),
                            )
                            .toList(),
                        value: _selectedCategory,
                        onChanged: (item) {
                          setState(() {
                            _selectedCategory = item;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _submitData,
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(
                      fontSize: 17.5,
                      fontWeight: FontWeight.w500,
                    ),
                    backgroundColor: const Color.fromARGB(255, 21, 91, 221),
                    foregroundColor: Colors.white,
                    fixedSize: const Size(100, 30),
                  ),
                  child: const Text('Save'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
