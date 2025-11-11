import 'package:flutter/material.dart';
import 'components/user_card.dart'; // Import our custom component

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Learning - Custom Components',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Custom Components'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
        elevation: 2,
      ),
      body: ListView(
        // ListView allows scrolling when content is larger than screen
        padding: const EdgeInsets.all(8),
        children: [
          // Header section
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '👋 Welcome to Flutter!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Here are some reusable UserCard components:',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          
          // Using our custom UserCard component multiple times with different data
          const UserCard(
            name: 'Alice Johnson',
            role: 'Flutter Developer',
            avatarUrl: 'https://i.pravatar.cc/150?img=1',
            cardColor: Colors.blue,
          ),
          
          const UserCard(
            name: 'Bob Smith',
            role: 'UI/UX Designer',
            avatarUrl: 'https://i.pravatar.cc/150?img=2',
            cardColor: Colors.purple,
          ),
          
          const UserCard(
            name: 'Carol Williams',
            role: 'Product Manager',
            avatarUrl: 'https://i.pravatar.cc/150?img=3',
            cardColor: Colors.teal,
          ),
          
          const UserCard(
            name: 'David Brown',
            role: 'Backend Engineer',
            avatarUrl: 'https://i.pravatar.cc/150?img=4',
            cardColor: Colors.orange,
          ),
          
          // Info card explaining the concept
          Card(
            margin: const EdgeInsets.all(12),
            color: Colors.amber.shade50,
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.lightbulb, color: Colors.amber),
                      SizedBox(width: 8),
                      Text(
                        'Learning Point',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Text(
                    '✨ You just learned:\n\n'
                    '1. How to create a reusable component (UserCard)\n'
                    '2. How to pass props/parameters to components\n'
                    '3. How to style components with gradients and shadows\n'
                    '4. How to compose widgets (Row, Column, Card, etc.)\n'
                    '5. How to use the same component multiple times',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 12),
                  Text(
                    '💡 Try: Tap the arrow icons on any card!',
                    style: TextStyle(
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
