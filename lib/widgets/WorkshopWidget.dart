import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// State Notifier to handle workspace expansion/collapse
class WorkspacesNotifier extends StateNotifier<bool> {
  WorkspacesNotifier() : super(false);

  void toggle() => state = !state; // Toggle expansion state
}

final workspacesProvider = StateNotifierProvider<WorkspacesNotifier, bool>((ref) {
  return WorkspacesNotifier();
});

/// Workspaces Widget using Riverpod
class WorkspacesWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isExpanded = ref.watch(workspacesProvider);
    final headerColor = isExpanded ? Colors.blue.shade100 : Colors.white;

    return Container(
      width: 220,
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: headerColor, // Header background color changes
            child: ListTile(
              title: Text(
                "WORKSPACES",
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              trailing: IconButton(
                icon: Icon(
                  isExpanded ? Icons.remove : Icons.add, // Toggle icon
                  color: Colors.black,
                ),
                onPressed: () => ref.read(workspacesProvider.notifier).toggle(),
              ),
            ),
          ),
          if (isExpanded) ...[
            ListTile(
              title: Text("Adstacks", style: TextStyle(color: Colors.black),textAlign: TextAlign.center,),
              trailing: Icon(Icons.arrow_drop_down, color: Colors.black),
            ),
            ListTile(
              title: Text("Finance", style: TextStyle(color: Colors.black),textAlign: TextAlign.center,),
              trailing: Icon(Icons.arrow_drop_down, color: Colors.black),
            ),
          ],
        ],
      ),
    );
  }
}
