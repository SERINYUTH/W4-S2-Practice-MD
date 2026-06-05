import 'package:flutter/material.dart';

class HobbyCard extends StatelessWidget {
  const HobbyCard({
    super.key,
    required this.color,
    required this.icon,
    required this.hobby,
  });

  final IconData icon;
  final Color color;
  final String hobby;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Row(
            children: [
              Icon(icon),
              SizedBox(width: 20),
              Text(hobby, style: TextStyle(fontSize: 10)),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(title: const Text('Hobby', style: TextStyle(color: Colors.black),),),
        body: Padding(
          padding: EdgeInsets.all(40),
          child: Column(
            children: [
              HobbyCard(
                color: Colors.green,
                icon: Icons.travel_explore,
                hobby: 'Travelling',
              ),
              SizedBox(height: 10,),
              HobbyCard(  
                color: Colors.blue,
                icon: Icons.skateboarding,
                hobby: 'Skating',
              ),
            ]
            
          ),
        ),
      ),
    )
  );
}
