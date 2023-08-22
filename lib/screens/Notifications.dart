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
            description: 'C-20 Industrial training results relesed .',
            icon: Icons.message,
            time: '1 day ago',
          ),
          _buildNotificationItem(
            title: 'Exams',
            description: 'V sem exams started.',
            icon: Icons.message,
            time: '7 days ago',
          ),
          _buildNotificationItem(
            title: 'attendence ',
            description: 'Attendence of may updated',
            icon: Icons.message,
            time: '10 days',
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
