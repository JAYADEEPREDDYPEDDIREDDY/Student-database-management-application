import 'package:flutter/material.dart';

class GalleryPage extends StatelessWidget {
  final List<String> images = [
    'https://picsum.photos/id/1015/500/500',
    'https://picsum.photos/id/1018/500/500',
    'https://picsum.photos/id/1020/500/500',
    'https://picsum.photos/id/1021/500/500',
    'https://picsum.photos/id/1022/500/500',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(8),
        itemCount: images.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return Scaffold(
                      appBar: AppBar(),
                      body: Center(
                        child: Image.network(images[index]),
                      ),
                    );
                  },
                ),
              );
            },
            child: Image.network(
              images[index],
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
