import 'package:flutter/material.dart';

class UserManagementCard extends StatelessWidget {
  final String name;
  final VoidCallback onView;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  const UserManagementCard({
    super.key,
    required this.name,
    required this.onView,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      width: double.infinity,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      child: Row(
        children: [
          Text(
            name.toString(),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          IconButton(
            icon: const Icon(Icons.remove_red_eye),
            onPressed: onView,
          ),
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: onEdit,
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: onDelete,
          )
        ],
      ),
    );
  }
}
