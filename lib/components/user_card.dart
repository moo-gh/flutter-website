import 'package:flutter/material.dart';

/// A reusable UserCard component that displays user information
/// 
/// This is a StatelessWidget because it doesn't need to manage any state.
/// It simply displays the data passed to it through its constructor.
class UserCard extends StatelessWidget {
  // Properties (props) that this component receives
  final String name;
  final String role;
  final String avatarUrl;
  final Color cardColor;

  /// Constructor - This is how we pass data to the component
  /// 
  /// The 'required' keyword means these parameters must be provided
  /// The 'super.key' is used for widget identification in the widget tree
  const UserCard({
    super.key,
    required this.name,
    required this.role,
    required this.avatarUrl,
    this.cardColor = Colors.blue, // Default value if not provided
  });

  @override
  Widget build(BuildContext context) {
    // The build method returns the widget tree
    // It describes how this component should look
    return Card(
      // Card widget provides Material Design card styling
      elevation: 4, // Shadow depth
      margin: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              cardColor.withOpacity(0.7),
              cardColor.withOpacity(0.3),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          // Row arranges children horizontally
          children: [
            // Avatar circle
            CircleAvatar(
              radius: 35,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 32,
                backgroundImage: NetworkImage(avatarUrl),
              ),
            ),
            const SizedBox(width: 16), // Spacing between widgets
            
            // Text information
            Expanded(
              // Expanded makes the child take up remaining space
              child: Column(
                // Column arranges children vertically
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    role,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                ],
              ),
            ),
            
            // Action icon
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              color: Colors.white,
              onPressed: () {
                // Show a snackbar when pressed
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Clicked on $name\'s card'),
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

