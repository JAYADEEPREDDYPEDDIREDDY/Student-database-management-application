import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: ListView(
        children: [
          _buildNotificationItem(
            title: 'New Message',
            description: 'You have a new message from John.',
            icon: Icons.message,
            time: '2 minutes ago',
          ),
          _buildNotificationItem(
            title: 'New Order',
            description: 'You have a new order from Jane.',
            icon: Icons.shopping_cart,
            time: '5 minutes ago',
          ),
          _buildNotificationItem(
            title: 'New Comment',
            description: 'John commented on your post.',
            icon: Icons.comment,
            time: '10 minutes ago',
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationItem({
    required String title,
    required String description,
    required IconData icon,
    required String time,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(description),
      trailing: Text(time),
    );
  }
}
