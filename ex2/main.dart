import 'package:flutter/material.dart';

enum ButtonType {
  primary(color: Colors.blue),
  secondary(color: Colors.green),
  disable(color: Colors.grey);

  final Color color;

  const ButtonType({required this.color});
}

enum Position { left, right }

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.label,
    required this.icon,
    required this.type,
    this.position = Position.left,
  });

  final String label;
  final IconData icon;
  final Position position;
  final ButtonType type;

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: type.color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: position == Position.left
          ? [Icon(icon), SizedBox(width: 10), Text(label)]
          : [Text(label), SizedBox(width: 10,), Icon(icon)],
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Custom Button"),),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                CustomButton(label: 'Submit', icon: Icons.check, type: ButtonType.primary, position: Position.right,),
                SizedBox(height: 20,),
                CustomButton(label: 'Time', icon: Icons.access_time, type: ButtonType.secondary, position: Position.left,),
              ],
            )
          ),
        ),
      ),
    ),
  );
}
