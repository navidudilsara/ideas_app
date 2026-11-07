import 'package:flutter/material.dart';
import 'package:ideas_app/add_idea.dart';
import 'package:ideas_app/idea_card.dart';
import 'package:ideas_app/idea.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  final List<Idea> ideasList = [];

  void showIdea(Idea idea) {
    setState(() {
      ideasList.add(idea);
    });
  }

  void _showAddIdeaSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => AddIdea(onAddIdea: showIdea),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        title: const Text('Ideas'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.label),
            color: Colors.white,
          ),
        ],
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 35,
        ),
        backgroundColor: const Color(0xFF1E3A8A),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.vertical(
            bottom: Radius.circular(10),
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _showAddIdeaSheet,
        backgroundColor: const Color(0xFF1E3A8A),
        foregroundColor: Colors.white,
        elevation: 5,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, size: 28),
      ),

      body: ListView.builder(
        itemCount: ideasList.length,
        itemBuilder: (ctx, index) => IdeaCard(
          title: ideasList[index].title,
          description: ideasList[index].description,
          category: ideasList[index].category,
        ),
      ),
    );
  }
}
