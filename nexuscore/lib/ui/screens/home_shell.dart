import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../tabs/tasks_screen.dart';
import '../tabs/calendar_screen.dart';
import '../tabs/notes_screen.dart';
import '../tabs/backup_screen.dart';
import '../../features/tasks/task_creation_screen.dart';
import '../../features/notes/note_editor_screen.dart';

class HomeShell extends ConsumerStatefulWidget {
  const HomeShell({super.key});

  @override
  ConsumerState<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends ConsumerState<HomeShell> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NexusCore'),
        bottom: TabBar(
          controller: _tabController,
          labelColor: AppColors.accent,
          unselectedLabelColor: Colors.white70,
          indicatorColor: AppColors.accent,
          tabs: const [
            Tab(icon: Icon(Icons.task), text: 'Tasks'),
            Tab(icon: Icon(Icons.calendar_month), text: 'Calendar'),
            Tab(icon: Icon(Icons.note_add), text: 'Notes'),
            Tab(icon: Icon(Icons.cloud_off), text: 'Backup'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          TasksScreen(),
          CalendarScreen(),
          NotesScreen(),
          BackupScreen(),
        ],
      ),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  Widget? _buildFloatingActionButton() {
    switch (_tabController.index) {
      case 0: // Tasks
        return FloatingActionButton(
          onPressed: () => _createNewTask(),
          backgroundColor: AppColors.accent,
          foregroundColor: Colors.black,
          child: const Icon(Icons.add_task),
        );
      case 2: // Notes
        return FloatingActionButton(
          onPressed: () => _createNewNote(),
          backgroundColor: AppColors.accent,
          foregroundColor: Colors.black,
          child: const Icon(Icons.note_add),
        );
      default:
        return null;
    }
  }

  void _createNewTask() {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => const TaskCreationScreen()
    ));
  }

  void _createNewNote() {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => const NoteEditorScreen()
    ));
  }
}