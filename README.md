import 'package:flutter/material.dart';

void main() {
runApp(
MaterialApp(
home: Scaffold(
appBar: AppBar(
backgroundColor: Colors.pink,
title: Text('Hello Flutter'),

          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                'https://via.placeholder.com/150', // Replace with your image URL
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Welcome to Flutter!',
              style: TextStyle(
                fontSize: 30,
                color: Colors.pink,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15),
            Text(
              'Building beautiful apps!',
              style: TextStyle(
                fontSize: 19,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.redAccent,
          child: Icon(Icons.add),
          onPressed: () {
            print('Button Pressed!');
          },
        ),
      ),
    ),
);
}
