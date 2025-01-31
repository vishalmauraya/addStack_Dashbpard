import 'package:dashboard_app/Consts/Size.dart';
import 'package:dashboard_app/widgets/topCreators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Define a provider to track the selected project card
final selectedProjectProvider = StateProvider<int?>((ref) => null);

class CombinedContainers extends ConsumerWidget {
  const CombinedContainers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // All Projects Container
        Container(
          width: 250,
          height: 200,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: const Color(0xFF282C34),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'All Projects',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: ListView(
                  children: List.generate(
                    3,
                        (index) => _buildProjectItem(
                      context,ref,
                      index: index,
                      title: 'Technology behind the Blockchain',
                      details: 'Project #${index + 1} • See project details',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(width: 5),

        // Top Creators Container
        TopCreatorsCard()
      ],
    );
  }

  // Project Item with selectable Card
  Widget _buildProjectItem(BuildContext context,WidgetRef ref, {required int index, required String title, required String details}) {
    final selectedProject = ref.watch(selectedProjectProvider);
    final isSelected = selectedProject == index;

    return GestureDetector(
      onTap: () {
        ref.read(selectedProjectProvider.notifier).state = isSelected ? null : index;
      },
      child: Padding(
        padding: isSelected?EdgeInsets.symmetric(vertical: 1):EdgeInsets.symmetric(horizontal:4,vertical: 2.0),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: isSelected ? Colors.red : Colors.white,),
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 8.0,vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize:isSelected?getHeight(context, 1.4): getHeight(context, 1.2)

                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      details,
                      style: TextStyle(
                        color: isSelected ? Colors.white70 : Colors.black54,
                        fontSize:isSelected?getHeight(context, 1): getHeight(context, 0.8),
                      ),
                    ),
                    Icon(Icons.edit,color: isSelected?Colors.white:Colors.black,size: getHeight(context, 1.5),)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Creator Item (Not selectable)
  Widget _buildCreatorItem(BuildContext context,WidgetRef ref, {required String name, required String artworks}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          const CircleAvatar(radius: 10, backgroundColor: Colors.grey), // Example avatar
          const SizedBox(width: 8.0),
          Expanded(
            child: Text(
              name,
              style:  TextStyle(color: Colors.white,fontSize: getHeight(context, 1.2)),
            ),
          ),
          Text(
            artworks,
            style: TextStyle(color: Colors.white70,fontSize: getHeight(context,1.2)),
          ),
        ],
      ),
    );
  }
}
