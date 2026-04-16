import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:assignment_two_flutter_ui_abdul_shahariar_shafin_2220744/models/task_model.dart';

class TaskRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _collectionName = 'tasks';

  /// Add a new task to Firestore
  Future<String> addTask(Task task) async {
    try {
      final docRef = await _firestore.collection(_collectionName).add(task.toJson());
      return docRef.id;
    } catch (e) {
      throw Exception('Failed to add task: $e');
    }
  }

  /// Delete a task from Firestore
  Future<void> deleteTask(String taskId) async {
    try {
      await _firestore.collection(_collectionName).doc(taskId).delete();
    } catch (e) {
      throw Exception('Failed to delete task: $e');
    }
  }

  /// Update a task in Firestore
  Future<void> updateTask(String taskId, Map<String, dynamic> updates) async {
    try {
      await _firestore.collection(_collectionName).doc(taskId).update(updates);
    } catch (e) {
      throw Exception('Failed to update task: $e');
    }
  }

  /// Get all tasks as a stream for real-time updates
  Stream<List<Task>> getTasks() {
    try {
      return _firestore
          .collection(_collectionName)
          .orderBy('createdAt', descending: true)
          .snapshots()
          .map((snapshot) {
        return snapshot.docs
            .map((doc) => Task.fromFirestore(doc))
            .toList();
      });
    } catch (e) {
      throw Exception('Failed to fetch tasks: $e');
    }
  }

  /// Get a single task by ID
  Future<Task?> getTask(String taskId) async {
    try {
      final doc = await _firestore.collection(_collectionName).doc(taskId).get();
      if (doc.exists) {
        return Task.fromFirestore(doc);
      }
      return null;
    } catch (e) {
      throw Exception('Failed to fetch task: $e');
    }
  }
}
