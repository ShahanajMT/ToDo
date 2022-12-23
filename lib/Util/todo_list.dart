import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  //TODO We have 3 variable for doing the TODO

  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext?)? deleteFunction;

  TodoTile({
      super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged,
      required this.deleteFunction,
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            
          ],
        ),
        
        child: Container(
          // ignore: sort_child_properties_last
          child: Padding(
            padding: const  EdgeInsets.all(24.0),
            child: Row(
              children: [
                //! CheckBox
      
                Checkbox(
                  value: taskCompleted,
                   onChanged: onChanged,
                   activeColor: Colors.black,
                ),
                //! Task Name
                Text(
                  taskName,
                  style: TextStyle(
                    decoration: taskCompleted 
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  ),
                ),
              ],
              
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.indigoAccent,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        
      ),
    );
  }
}
